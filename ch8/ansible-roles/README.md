# Creating portable roles for Ansible

## Getting Started:

```bash
# Bring up the environment
vagrant up
vagrant ssh

# Install Ansible collections
ansible-galaxy collection install -r ./collections/requirements.yml

# Run the two playbooks to observe the difference between tasks and roles
ansible-playbook long-playbook.yml
ansible-playbook role-playbook.yml
```