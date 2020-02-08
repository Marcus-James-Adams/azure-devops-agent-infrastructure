FROM microsoft/vsts-agent:latest

# Build-time metadata as defined at http://label-schema.org

LABEL org.label-schema.name="Azure DevOps Agent with Infrastrucure Tools" \
    org.label-schema.url="https://github.com/marcus-james-adams/" \
    org.label-schema.vcs-url="https://github.com/marcus-james-adams//" \
    org.label-schema.schema-version="1.0"
                
ENV TERRAFORM_VERSION 0.12.20
ENV PACKER_VERSION 1.4.5
ENV PACKER_WINDOWS_UPDATE_VERSION 0.8.0
ENV PACKER_DSC_VERSION 0.0.4-pre-release
ENV ANSIBLE_VERSION 2.9.4

# Install Packer
RUN echo "===> Installing Packer ${PACKER_VERSION} ..." \
 && wget https://releases.hashicorp.com/packer/${PACKER_VERSION}/packer_${PACKER_VERSION}_linux_amd64.zip \
 && unzip packer_${PACKER_VERSION}_linux_amd64.zip  \
 && mv packer /usr/local/bin/packer \
 && rm packer_${PACKER_VERSION}_linux_amd64.zip 
 

 # Install packer-windows-update
RUN echo "===> Installing Packer Provisioner Windows Update ${{PACKER_WINDOWS_UPDATE_VERSION} ..." \
 && wget https://github.com/rgl/packer-provisioner-windows-update/releases/download/v${PACKER_WINDOWS_UPDATE_VERSION}/packer-provisioner-windows-update-linux.tgz \
 && tar xvzf  packer-provisioner-windows-update-linux.tgz  \
 && mv packer-provisioner-windows-update /usr/local/bin/packer \
 && rm packer-provisioner-windows-update-linux.tgz 
 
 # Install packer-dsc
RUN echo "===> Installing Packer DSC ${{PACKER_DSC_VERSION} ..." \
 && wget https://github.com/darkedges/packer-dsc/releases/download/${PACKER_DSC_VERSION}/packer-provisioner-dsc \
 && mv packer-provisioner-dsc /usr/local/bin/packer \
 && rm packer-provisioner-dsc 

# Install Terraform
RUN echo "===> Installing Terraform ${TERRAFORM_VERSION}..." \
 && wget https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip \
 &&	unzip terraform_${TERRAFORM_VERSION}_linux_amd64.zip \
 && mv terraform /usr/local/bin/terraform \
 && rm terraform_${TERRAFORM_VERSION}_linux_amd64.zip 
	
# Install Ansible
RUN  echo "===> Installing Ansible..." \
 && apt-get update \   
 && apt-get install -y --no-install-recommends \
    ansible \      
 && rm -rf /var/lib/apt/lists/*      \ 
 && echo "===> Adding hosts for convenience..." \
 && mkdir -p /etc/ansible                       \
 && echo 'localhost' > /etc/ansible/hosts

