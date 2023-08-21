# Virtualisierung_HF
HF-ICT - Virtualisierung


# Current Scenario

So in the current Scenario we have 2 Almalinux9 Host with a simple root password.

At the end we want to have a small k8s cluster where we can spawn nodes.
Also the servers should be secured with some simple stuff and all of this should be achived with a single ansible run.


## Mashines / Ansible Inventory

```yml
all:
  children:
    k8s_master:
      hosts:
        master_1:
          ansible_host: 10.0.0.10 
    k8s_worker:
      hosts:
        worker_1:
          ansible_host: 10.0.0.11 

  vars:
    ansible_ssh_user: sa_ansible
    ansible_ssh_private_key_file: vault/ansiblekey.yml

```


# Installation

1. Installing the Gitrepo
    ```bash
    git clone https://github.com/Destracerlock/Virtualisierung_HF.git
    ```
2. Decrypt or create the ansible key
    Decrypt:
    ```bash
    ansible-vault decrypt vault/key/ansible_ssh_key
    ```
    Create:
    ```bash 
    [[ -f vault/key/ansible_ssh_key ]] && rm -rf vault/key/ansible_ssh_key*
    ssh-keygen -t ed25519 -f vault/ansible_ssh_key -N ""
    ```

3. Configure ansible inventory
    ```bash
    vi inventory.yml
    ```

4. Run ansible playbook fot first time
    ```bash
    ansible-playbook -u root -k main.yml
    ```




