# ------ Terraform ------

# Ensure system is up-to-date. Install software-properties-common
sudo apt-get update && sudo apt-get install -y gnupg software-properties-common

# Download the signing key
wget -O- https://apt.releases.hashicorp.com/gpg | \
    gpg --dearmor | \
    sudo tee /usr/share/keyrings/hashicorp-archive-keyring.gpg

# Verify key fingerprint - should match E8A0 32E0 94D8 EB4E A189 D270 DA41 8C88 A321 9F7B
gpg --no-default-keyring \
    --keyring /usr/share/keyrings/hashicorp-archive-keyring.gpg \
    --fingerprint

# Add official Hashicorp repository to system
echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] \
    https://apt.releases.hashicorp.com $(lsb_release -cs) main" | \
    sudo tee /etc/apt/sources.list.d/hashicorp.list

# Update package
sudo apt update

# Install terraform from the new repository
sudo apt-get install terraform

# Verify Installation
terraform -version

# ------ Ansible ------
sudo apt-get update
sudo apt-add-repository ppa:ansible/ansible
sudo apt-get install ansible
# Verify Installatio
ansible --version

echo "*****Installation Complete*****"
