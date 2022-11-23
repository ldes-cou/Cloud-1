#check if server answers
# ansible all -i hosts -m ping -u root
ansible all -m ping
#deploy playbook
ansible-playbook main.yml 
