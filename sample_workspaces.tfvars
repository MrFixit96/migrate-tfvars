workspaces = {
  app_setup ={
    "name"              = "app_setup-gcp-jca-tfe-testing-sandbox",
    "working_directory" = "app_setup",
    "vcs_repo"          = {
      "identifier"         = "mrfixit96/terraform-demo",
      "branch"             = "tf-12-update",
      "ingress_submodules" = true,
      "oauth_token_id"     = "ot-SkuwfW6uGhQV1CZq"
    }
  },
  admin_setup = {
  "name"              = "admin_setup-gcp-jca-tfe-testing-sandbox",
  "working_directory" = "admin_setup",
  "vcs_repo"          = {
    "identifier"         = "mrfixit96/terraform-demo",
    "branch"             = "tf-12-update",
    "ingress_submodules" = true,
    "oauth_token_id"     = "ot-SkuwfW6uGhQV1CZq"
  }
},
plaform_setup = {
  "name"              = "platform_setup-gcp-jca-tfe-testing-sandbox",
  "working_directory" = "platform_setup",
  "vcs_repo"          = {
    "identifier"         = "mrfixit96/terraform-demo",
    "branch"             = "tf-12-update",
    "ingress_submodules" = true,
    "oauth_token_id"     = "ot-SkuwfW6uGhQV1CZq"
  }
},
project_setup = {
  "name"              = "project_setup-gcp-jca-tfe-testing-sandbox",
  "working_directory" = "project_setup",
  "vcs_repo"          =  {
    "identifier"         = "mrfixit96/terraform-demo",
    "branch"             = "tf-12-update",
    "ingress_submodules" = true,
    "oauth_token_id"     = "ot-SkuwfW6uGhQV1CZq"
  }
}
}
