######################################
#       START SECTION                #
#       BASIC DEPENDENCIES           #
######################################
FROM ubuntu:18.04

RUN apt-get clean -y
RUN apt-get update -y
RUN apt-get upgrade -y
RUN apt-get install wget gnupg curl unzip jq -y

######################################
#       START SECTION                #
#       INSTALL TERRAFORM            #
######################################
ENV TERRAFORM_VERSION="0.12.23"
RUN wget "https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip"
RUN unzip "terraform_${TERRAFORM_VERSION}_linux_amd64.zip"
RUN mv terraform /bin

######################################
#       START SECTION                #
#       INSTALL AZURE CLI            #
######################################
RUN curl -sL https://aka.ms/InstallAzureCLIDeb | bash


######################################
#       START SECTION                #
#       INSTALL AZURE FUNCTION       #
#       CORE TOOLS                   #
######################################
RUN wget -q https://packages.microsoft.com/config/ubuntu/18.04/packages-microsoft-prod.deb
RUN dpkg -i packages-microsoft-prod.deb
RUN apt-get update -y
RUN apt-get install azure-functions-core-tools-3 -y

######################################
#       START SECTION                #
#       ADD TO PATH                  #
######################################
ENV PATH="/bin:${PATH}"
