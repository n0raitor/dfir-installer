###When the Ubuntu installer prompts you for details about the user it will create, select the following to stay consistent with the default configuration of REMnux:
##
#Full name: REMnux User
#Username: remnux
#Password: malware

wget https://REMnux.org/remnux-cli
sha256sum remnux-cli
echo "Validate with https://docs.remnux.org/install-distro/install-from-scratch"
read -p "Press enter to continue after validating the checksum"

mv remnux-cli remnux
chmod +x remnux
sudo mv remnux /usr/local/bin

# Install Dependencies
sudo apt install -y gnupg curl

# Run the REMnux Installer
sudo remnux install

echo "REMnux installation complete. Restart WSL"