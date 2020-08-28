package main

import (
	"bufio"
	"errors"
	"flag"
	"fmt"
	"log"
	"os"
	"strings"
	"testing"

	"github.com/rodaine/hclencoder"
)

// GetFlags : reads input file with k/v pairs
func GetFlags() (iFilename string, oFilename string, verbose bool, err error) {
	ifilenamePtr := flag.String("i", "terraform.tfvars", "Path/name of input file")
	ofilenamePtr := flag.String("o", "tfvars-migrate.tf", "Path/name of output file")
	verbosePtr := flag.Bool("v", false, "Turn on Debug Printing")

	flag.Parse()
	if ifilenamePtr == nil {
		log.Fatal("filename not provided")
		err := errors.New("filename not provided")
		return "", "", verbose, err
	}

	return *ifilenamePtr, *ofilenamePtr, *verbosePtr, nil
}

// ConfigProperties : is a map of all incoming k/v pairs
type ConfigProperties map[string]string

// ReadPropertiesFile : reads in a file with one or more k/v pairs
func ReadPropertiesFile(filename string) (ConfigProperties, error) {
	config := ConfigProperties{}

	if len(filename) == 0 {
		return config, nil
	}
	file, err := os.Open(filename)
	if err != nil {
		log.Fatal(err)
		return nil, err
	}
	defer file.Close()

	scanner := bufio.NewScanner(file)
	for scanner.Scan() {
		line := scanner.Text()
		if equal := strings.Index(line, "="); equal >= 0 {
			if key := strings.TrimSpace(line[:equal]); len(key) > 0 {
				value := ""
				if len(line) > equal {
					value = strings.TrimSpace(line[equal+1:])
				}
				config[key] = value
			}
		}
	}

	if err := scanner.Err(); err != nil {
		log.Fatal(err)
		return nil, err
	}

	return config, nil
}

func main() {

	type Resource struct {
		Type        string `hcl:",key"`
		Name        string `hcl:",key"`
		Key         string `hcl:"key"`
		Value       string `hcl:"value"`
		Category    string `hcl:"category"`
		Description string `hcl:"description"`
		HCL         bool   `hcl:"hcl"`
		Sensitive   bool   `hcl:"sensitive"`
		WorkspaceID string `hcl:"workspace_id"`
	}

	type Config struct {
		Resources []Resource `hcl:"resource"`
	}

	input := Config{
		Resources: []Resource{
			{
				Type:        "tfe_variable",
				Name:        "billing_account",
				Key:         "billing_account",
				Value:       "var.billing_account",
				Category:    "terraform",
				WorkspaceID: "each.value.id",
				Description: "GCP Billing Account ID for Hashicorp EA Team",
				Sensitive:   true,
				HCL:         false,
			},
		},
	}

	ifilenamePtr, ofilenamePtr, verbose, err := GetFlags()
	tfvars, err := ReadPropertiesFile(ifilenamePtr)
	complexValue := []string{}
	for k, v := range tfvars {
		fmt.Print("DEBUG:: key " + k + "\n")
		fmt.Print("DEBUG:: key " + k + " : value " + v + "\n")
		if !strings.ContainsAny(k, "{}") {
			if !strings.ContainsAny(v, "{}[]|") {
				input.Resources = append(input.Resources, Resource{"tfe_variable", k, k, v, "terraform", "<DESCRIPTION>", false, false, "<WORKSPACE_ID>"})
			} else if v == "{" {
				fmt.Print("DEBUG:: value is an LBRACE" + "\n")
				complexValue = append(complexValue, v)
				continue
			} else if strings.ContainsAny(v, "{}[]|") {
				input.Resources = append(input.Resources, Resource{"tfe_variable", k, k, v, "terraform", "<DESCRIPTION>", true, false, "<WORKSPACE_ID>"})
			}
		}
	}

	if verbose {
		fmt.Print("DEBUG:: will write out" + ofilenamePtr + "\n")
	}

	hcl, err := hclencoder.Encode(input)
	if err != nil {
		log.Fatal("unable to encode: ", err)
	}
	cleanHCL := strings.Replace(string(hcl), "\"\"", "\"", -1)
	fmt.Print("\n" + string(cleanHCL))

}

// TestReadPropertiesFile : Test function for this package
func TestReadPropertiesFile(t *testing.T) {
	props, err := ReadPropertiesFile("sample_test.tfvars")
	if err != nil {
		t.Error("Error while reading properties file")
	}

	if props["host"] != "localhost" || props["proxyHost"] != "test" || props["protocol"] != "https://" || props["chunk"] != "" {
		t.Error("Error properties not loaded correctly")
	}

}

// #########################################################################################################################
//  Keeping the below Schema in here for reference until finished.
// #########################################################################################################################

// Schema: map[string]*schema.Schema{
// 	"key": {
// 		Type:     schema.TypeString,
// 		Required: true,
// 	},

// 	"value": {
// 		Type:      schema.TypeString,
// 		Optional:  true,
// 		Default:   "",
// 		Sensitive: true,
// 	},

// 	"category": {
// 		Type:     schema.TypeString,
// 		Required: true,
// 		ForceNew: true,
// 		ValidateFunc: validation.StringInSlice(
// 			[]string{
// 				string(tfe.CategoryEnv),
// 				string(tfe.CategoryTerraform),
// 			},
// 			false,
// 		),
// 	},

// 	"description": {
// 		Type:     schema.TypeString,
// 		Optional: true,
// 		Default:  "",
// 	},

// 	"hcl": {
// 		Type:     schema.TypeBool,
// 		Optional: true,
// 		Default:  false,
// 	},

// 	"sensitive": {
// 		Type:     schema.TypeBool,
// 		Optional: true,
// 		Default:  false,
// 	},

// 	"workspace_id": {
// 		Type:     schema.TypeString,
// 		Required: true,
// 		ForceNew: true,
// 		ValidateFunc: validation.StringMatch(
// 			workspaceIdRegexp,
// 			"must be the workspace's external_id",
// 		),
// 	},
// }
