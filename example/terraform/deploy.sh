export ARM_CLIENT_ID="$SP_APP_ID"
export ARM_CLIENT_SECRET="$SP_APP_PW"
export ARM_SUBSCRIPTION_ID="$AZ_SUB_ID"
export ARM_TENANT_ID="$SP_TENANT_ID"

export TF_VAR_location="$TARGET_LOCATION"
export TF_VAR_environment="$TARGET_ENV"
export TF_VAR_your_id="$YOUR_ID"

#Initialize terraform and its providers
terraform init

#Create an output for plan and execute the calcuation of the plan
mkdir /tfplan
terraform plan -out/tfplan/tfplan.out

#Apply the outputted plan
terraform apply -auto-approve "/tfplan/tfplan.out"

rg_name=$(terraform output my_rg_name)
echo "### OUTPUTS ###"
echo "$rg_name"
echo "### OUTPUTS ###"