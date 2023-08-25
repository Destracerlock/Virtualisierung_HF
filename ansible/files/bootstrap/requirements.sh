# Update the system
dnf update -y

# Install required packages
dnf install -y epel-release
dnf install -y python3-pip python3-devel gcc libffi-devel openssl-devel git

# Upgrade pip
pip3 install --upgrade pip

# Install Ansible
pip3 install ansible

echo "Ansible installation completed"

# Install additional packages for ansible-pull
dnf install -y cronie # For scheduling ansible-pull jobs using cron
dnf install -y openssh-clients # Required for SSH connectivity

echo "Additional dependencies for ansible-pull installed"

# Enable and start the cron service
systemctl enable cron
systemctl start cron

echo "Cron service enabled and started"