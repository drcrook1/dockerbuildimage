#!/bin/bash

echo "### EXPORTING VARIABLES ###"
export ARM_CLIENT_ID="$SP_APP_ID"
export ARM_CLIENT_SECRET="$SP_APP_PW"
export ARM_SUBSCRIPTION_ID="$SP_SUB_ID"
export ARM_TENANT_ID="$SP_TENANT_ID"

export TF_VAR_env="$TARGET_ENV"
export TF_VAR_location="$TARGET_LOCATION"
export TF_VAR_your_id="$YOUR_ID"
echo "### /EXPORTING VARIABLES ###"

terraform init

mkdir /tfplan
terraform plan -out=/tfplan/tfplan.out -state=/tf/state/tfstate.dev

terraform apply -auto-approve -state=/tf/state/tfstate.dev "/tfplan/tfplan.out"

rg_name=$(terraform output -state=/tf/state/tfstate.dev resource_group_name)
echo "My RG is: $rg_name"