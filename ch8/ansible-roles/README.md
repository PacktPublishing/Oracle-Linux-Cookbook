


ansible-galaxy collection install -r ./collections/requirements.yml -p ./collections



-e 'ansible_python_interpreter=/usr/bin/python3'

ansible-playbook -c local -i localhost role-playbook.yml -e 'ansible_python_interpreter=/usr/bin/python3'