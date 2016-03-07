# ansible-training
## Training plan
1. Introduction to Vagrant
    * why
    * how to install
    * configuration - bootstrap
    * /vagrant

1. Elements of Ansible
    * hosts
    * ansible.cfg
1. ansible command
    * run ping module
        * single server
        * multiple servers
     * run setup module
     * run shell module
        ansible -m shell -a "echo 'Hello, World!'" home -k

1. ansible-playbook
    * run playbook
    * run playbook with -v(vvv)
    * explain parts of playbook
    * externalize path to variable
    * override path with command line
    
        `ansible-playbook playbook.yml -k --extra-vars "path=~/ansible-folder-2"`
    * externalize variable to host_vars
    * externalize host variable and run on 2 environments (file vs folder)
    
        `ansible-playbook playbook.yml -k -e "hosts=ci:home"`

    * become_method (as of ansible 2.0)
    
        `ansible-playbook playbook.yml -k -e "hosts=home"`
    * explain problems with our environment
    
        `ansible-playbook playbook.yml -k -e "hosts=home" -vvvv`
        
  ```bash
  <localhost> SSH: EXEC sshpass -d14 ssh -C -vvv -o ControlMaster=auto -o ControlPersist=60s -o User=vagrant -o ConnectTimeout=10 -o ControlPath=/home/vagrant/.ansible/cp/ansible-ssh-%h-%p-%r -tt localhost '/bin/sh -c '"'"'sudo -H -S -n -u root /bin/sh -c '"'"'"'
  "'"'"'"'"'echo BECOME-SUCCESS-xuaspukjjohyqqwluqzjfmofvtzjxuww; LANG=en_US.UTF-8 LC_ALL=en_US.UTF-8 LC_MESSAGES=en_US.UTF-8 /usr/bin/python /home/vagrant/.ansible/tmp/ansible-tmp-1456407366.15-123733155942862/file; rm -rf "/home/vagrant/.ansible/tmp/ansible-tmp
  -1456407366.15-123733155942862/" > /dev/null 2>&1'"'"'"'"'"'"'"'"''"'"''
  ```


    * template
        * change the ownership of the folder
        * move hosts to vars
        * add template file
        * provide variables
        
            `ansible-playbook playbook.yml -k`
        * add backup=yes

    * multiple templates
        * simple solution
        * with items

    * tags
    * roles
    * tasks
    * jenkins
