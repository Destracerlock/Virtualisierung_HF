#!/bin/bash

# Directory to store ansible-pull configuration
PULL_DIR="/etc/ansible-pull"

# URL of the Ansible repository to pull from
REPO_URL="https://github.com/Destracerlock/Virtualisierung_HF.git"

# Branch of the repository to pull from
BRANCH="joku"

# Get the playbook name from the first command-line argument or use a default value
PLAYBOOK="${1:-tf_default}.yml"

# Run ansible-pull
ansible-pull -U $REPO_URL -C $BRANCH -d $PULL_DIR -o $PLAYBOOK
