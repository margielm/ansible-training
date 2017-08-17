# ansible-training
## Pre-requierments
1. Download and Install Git (https://git-scm.com/downloads)
1. Download and Install Vagrant (https://www.vagrantup.com/downloads.html)
1. Checkout source code from GitHub `git clone https://github.com/margielm/ansible-training.git`
1. Startup VM in vagrant
     ```bash
     cd ansible-training
     vagrant up
     ```
## Verification
Now you should be able to login to ubuntu VM and execute ansible
```bash
    vagrant ssh
    ansible --version
```
## Training plan
1. Introduction to Vagrant
    * why do we need it
    * Why do we have ansible pre-installed
    * /vagrant
    * ansible and windows 10

1. Elements of Ansible
    * hosts
    * ansible.cfg
    
1. ansible command
    * run ping module
        * single server
            `ansible -m ping localhost`
        * multiple servers
            ```bash
              ansible -m ping localhost,ci
              ansible -m ping localhost,ci -k
            ```
            
     * run setup module
        ```bash
           ansible -m setup localhost
        ```
     * run shell module
         ```bash
            ansible -m shell -a "echo 'Hello, World'" home -k
            ansible -m shell -a "echo 'Hello, World'" home -k -v(vvv)
            export ANSIBLE_KEEP_REMOTE_FILES=1
         ```

1. ansible-playbook
    * print hello world in playbook
    * run playbook.yml
        ```bash
          ansible-playbook playbook_1.yml
          ansible-playbook playbook_1.yml -v
        ```
    * register result and debug it
    * print stdout only
    * externalize message to variable
    * override message with command line
    
        ```bash
          ansible-playbook playbook_1.yml  --extra-vars "message='Good evening'"
          ansible-playbook playbook_1.yml  -e "message='Good evening'"
        ```
    * externalize variable to host_vars
    * externalize host variable and run on 2 environments (file vs folder)
    
        ```bash
          ansible-playbook playbook.yml -k -e "hosts=ci,home"
        ```
    * templating in playbook_2.yml
    * run and add become user
    * change variables and show back up
    * add with_items
    * Roles
        * Introduce roles in playbook_3.yml
        * file variable in a role
        * try to use with_items
        * duplicate roles
        * include_role
        * with_items for
    
    * explain problems with our environment
    
        ```bash
          ansible-playbook playbook.yml -k -e "hosts=home" -vvvv
        ```
        
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
