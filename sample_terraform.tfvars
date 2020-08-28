########################################################
#####Project setup info
#   Vars for creating project level related resource
#   (ie. vpc, firewall rules, vpc-peering, etc.)

## Terraform Enterprise info
tfe_org = "janderton"
tfe_host = "app.terraform.io"
email   = "janderton@hashicorp.com"

env = "sandbox"
project_name = "jca-tfe-testing"
project_id = "jca-tfe-testing"
billing_account = "01340E-ED8E31-9FCA36"
create_folder = false
credential_file = "/home/janderton/source/creds/jca-tf-testing-c4ea56a23af5.json"
org_id = "1091910689833"
set_parent_folder = true
folder = "224994417116"
region = "us-central1"
organization = "hashicorp.com"
prefix_tfe_setup = "TFE-DEMO-tfe_setup"
prefix_org_setup = "TFE-DEMO-org_setup"
prefix_project_setup = "TFE-DEMO-project_setup"
prefix_platform_setup = "TFE-DEMO-platform_setup"
prefix_org_policies = "TFE-DEMO-org_policies"
prefix_admin_setup = "TFE-DEMO-admin_setup"
prefix_app_setup = "TFE-DEMO-app_setup"
state_bucket_name = "jca-tfstate-hashicorp"
state_project_name = "jca-tf-testing"

### this is for peering over to another project's networks (used with a central security operations center project ie. csoc)
tf_state_project_setup_csoc = ""
prefix_project_setup_csoc = ""
csoc_state_bucket_name = ""

/*
#### Org_Policy related stuff
constraint = ["constraints/compute.disableNestedVirtualization","constraints/compute.disableSerialPortAccess","constraints/compute.skipDefaultNetworkCreation"]
org_iam_externalipaccess = []

#### Role Bindings to group and user accounts
org_administrator_org_binding=["group:gcpadmin@sandbox.com"]
org_viewer_org_binding = []
folder_viewer_org_binding = []
all_projects_org_owner = ["group:gcpadmin@sandbox.com"]
projects_viewer_org_binding = []
billing_account_admin = ["group:gcpadmin@sandbox.com"]
billing_account_user = []
billing_account_viewer = []
log_viewer_org_binding = ["group:gcpadmin@sandbox.com"]
log_viewer_folder_binding = []
org_policy_viewer_org_binding = ["group:gcpadmin@sandbox.com"]

network_admin_org_binding = ["group:gcpadmin@sandbox.com"]
stackdriver_monitoring_viewer_folder_binding = ["group:gcpadmin@sandbox.com"]
stackdriver_monitoring_viewer_org_binding = ["group:gcpadmin@sandbox.com"]
kubernetes_engine_viewer_folder_binding = ["group:gcpadmin@sandbox.com"]
compute_instance_viewer_folder_binding = ["group:gcpadmin@sandbox.com"]
service_account_creator_folder_level = ["group:gcpadmin@sandbox.com"]
*/

####### VPC Peering info
peer_auto_create_routes = true

####VPC (google_network) info
create_vpc_secondary_ranges = true

commons_private_network_name = "sm-tfe-gcp-core-tfe"

commons_private_region = "us-central1"

commons_private_subnet_flow_logs = true

commons_private_subnet_private_access = true

commons_private_subnet_ip = "10.0.1.0/24"

commons_private_subnet_name = "sm-tfe-gcp-core-private"

commons_private_subnet_secondary_ip1 = "172.17.0.0/16"

commons_private_subnet_secondary_ip2 = "172.16.0.0/16"

commons_private_subnet_secondary_name1 = "ip-cidr-range-k8-service"

commons_private_subnet_secondary_name2 = "ip-cidr-range-k8-pod"

###### Firewall Rule Info
commons_egress_destination_ranges = [""]

commons_egress_direction = "EGRESS"

commons_egress_enable_logging = true

commons_egress_ports = ["53","80", "443"]

commons_egress_priority = "1000"

commons_egress_protocol = "tcp"

commons_egress_target_tags = ["sandbox-egress"]

commons_ingress_direction = "INGRESS"

commons_ingress_enable_logging = true

commons_ingress_ports = ["22", "53", "80", "443", "8200", "8500"]

commons_ingress_priority = "1000"

commons_ingress_protocol = "tcp"

commons_ingress_source_ranges = ["10.0.101.0/24"]

commons_ingress_target_tags = ["sandbox-ingress"]

inbound_from_gke_enable_logging = true

inbound_from_gke_name = "inbound-from-gke"

inbound_from_gke_network_name = ""

inbound_from_gke_ports = ["1-65535"]

inbound_from_gke_priority = "1000"

inbound_from_gke_protocol = "tcp"

inbound_from_gke_source_ranges = ["172.16.0.0/24", "172.17.0.0/24"]

inbound_from_gke_target_tags = ["inbound-from-gke"]

inbound_to_commons_enable_logging = true

inbound_to_commons_name = "inbound-to-fw"

inbound_to_commons_network_name = ""

inbound_to_commons_ports = ["1-65535"]

inbound_to_commons_priority = "1000"

inbound_to_commons_protocol = "tcp"

inbound_to_commons_source_ranges = ["172.16.0.0/24", "172.17.0.0/24"]

inbound_to_commons_target_tags = ["inbound-to-sandbox"]

outbound_from_commons_destination_ranges = ["172.17.0.0/24", "172.16.0.0/28"]

outbound_from_commons_enable_logging = true

outbound_from_commons_name = "outbound-from-name"

outbound_from_commons_network_name = ""

outbound_from_commons_ports = ["1-65535"]

outbound_from_commons_priority = "1000"

outbound_from_commons_protocol = "tcp"

outbound_from_commons_target_tags = ["outbound-from-sandbox"]

outbound_from_gke_destination_ranges = ["172.16.0.0/24", "172.17.0.0/24"]

outbound_from_gke_enable_logging = true

outbound_from_gke_name = "outbound-to-gke-fw"

outbound_from_gke_network_name = ""

outbound_from_gke_ports = ["1-65535"]

outbound_from_gke_priority = "1000"

outbound_from_gke_protocol = "tcp"

outbound_from_gke_target_tags = ["outbound-to-gke"]

######### Google Public Access Info ###########################
google_apis_route = "google-apis"

fw_rule_allow_google_apis_egress = "allow-google-apis"

fw_rule_allow_hc_egress = "allow-healthcheck-egress"

fw_rule_allow_hc_ingress = "allow-healthcheck-ingress"

fw_rule_allow_master_node_egress = "allow-master-node-egress"

fw_rule_deny_all_egress = "deny-egress"


##################################################

// GKE
### GKE SETUP Info
cluster_name = "sandbox-gke-1"

network_name = "sm-tfe-gcp-core-tfe"

cluster_secondary_range_name = "ip-cidr-range-k8-pod"

services_secondary_range_name = "ip-cidr-range-k8-service"


min_master_version = "1.15.11-gke.12"


master_version  = "1.15.11-gke.12"


default_node_pool = true


network_policy = "false"


// Kubernetes Addons
horizontal_pod_autoscaling  = true


http_load_balancing = true


network_policy_config = false


kubernetes_dashboard = false


// Private Cluster Config
enable_private_endpoint = false


enable_private_nodes = false


// IP Allocation Config
use_ip_aliases = true


node_ipv4_cidr_block = "4"


cluster_ipv4_cidr_block = ""


services_ipv4_cidr_block = "172.17.0.0/16"


// Master Authorized Networks
master_authorized_network_name = "sm-tfe-core-public"


master_authorized_cidr_block = "10.0.101.0/24"


// NODE POOL //
// Management
node_auto_repair = "true"

node_name = "sandbox-gke-1-node"

node_tags = ["sandbox-ingress", "outbound-from-sandbox", "inbound-from-gke"]

initial_node_count = "1"

daily_maintenance_window = "07:00"

prod_machine_type = "n1-standard-2"

dev_machine_type = "g1-small"

disk_size_gb = "100"

disk_type = "pd-ssd"

min_node_cout = "1"

max_node_countn = "3"

node_auto_upgrade = true

preemptible = true

node_labels = {}

scopes = ["https://www.googleapis.com/auth/trace.append",
       "https://www.googleapis.com/auth/servicecontrol",
       "https://www.googleapis.com/auth/devstorage.read_only",
       "https://www.googleapis.com/auth/logging.write",
       "https://www.googleapis.com/auth/monitoring",
       "https://www.googleapis.com/auth/userinfo.email",
       "https://www.googleapis.com/auth/service.management.readonly"
           ]


image_type = "COS"

#network                = "" #USE REMOTE_STATE
#subnetwork_name        = "" #USE REMOTE_STATE
#node_labels              = "" # USE A MAP
#password               = "" # BASIC_AUTH DISABLED
#username               = "" # BASIC_AUTH DISABLED

###GOOGLE CLOUD SQL INFO##################################

sql_name = "wordpress"

cluster_region = "us-central1"

global_address_name = "cloudsql-private-ip-address"

global_address_purpose = "VPC_PEERING"

global_address_type = "INTERNAL"

global_address_prefix = "16"

#database Version Supports POSTGRES_9_6 or MySQL_5_7 or MySQL_5_6
database_version = "MYSQL_5_7"

db_instance_tier = "db-custom-2-13312"

availability_type = "REGIONAL"

backup_enabled = "true"

backup_start_time = "02:00"

db_disk_autoresize = "true"

db_disk_size = "10"

db_disk_type = "PD_SSD"

db_maintenance_window_day = "7"

db_maintenance_window_hour = "2"

db_maintenance_window_update_track = "stable"

db_user_labels = {}

ipv4_enabled = "false"

db_network = "sandbox-private"

sql_network = "sandbox-private"

db_authorized_networks = []

activation_policy = "ALWAYS"

db_name = ["wordpress"]

db_user_name = "wordpress-admin"

db_user_host = "%"

db_user_password = "admin123"

######## Helm Provider info ###################################
#
repo_url = "https://helm.releases.hashicorp.com"
chart_name = "consul"
