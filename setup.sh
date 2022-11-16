#check if server answers
ansible all -i hosts.yml -m ping -u root

#deploy playbook
ansible-playbook -i hosts.yml docker.yml -u root