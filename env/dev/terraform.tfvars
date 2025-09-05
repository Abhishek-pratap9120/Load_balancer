resource_group = {
    resource_group ={
        rg_name = "todo-dev-rg"
        location = "central india"
    }
}

virtual_network = {
    virtual_network ={
        virtual_network_name = "todo-dev-vnet"
        virtual_network_location = "central india"
        rg_name = "todo-dev-rg"
        address_space = ["10.0.0.0/16"]
    }
}

subnet = {
    subnet={
        subnet_name = "todo-dev-subnet"
        rg_name = "todo-dev-rg"
        virtual_network_name = "todo-dev-vnet"
        subnet_address_prefixes = ["10.0.1.0/24"]
    }
        subnet2={
        subnet_name = "todo-dev-subnet2"
        rg_name = "todo-dev-rg"
        virtual_network_name = "todo-dev-vnet"
        subnet_address_prefixes = ["10.0.2.0/24"]
    }
}
nsg = {
    nsg={
        nsg_name = "todo-dev-nsg"
        nsg_location = "central india"
        rg_name = "todo-dev-rg"
    }
        nsg2={
        nsg_name = "todo-dev-nsg2"
        nsg_location = "central india"
        rg_name = "todo-dev-rg"
    }
}
pip ={
    pip={
        pip_name = "todo-dev-pip"
        rg_name = "todo-dev-rg"
        pip_location = "central india"
        allocation_method = "Static"
    }
}
nic ={
    nic={
        nic_name = "todo-dev-nic"
        nic_location = "central india"
        rg_name = "todo-dev-rg"
        subnet_name = "todo-dev-subnet"
        virtual_network_name = "todo-dev-vnet"

    }
        nic2={
        nic_name = "todo-dev-nic2"
        nic_location = "central india"
        rg_name = "todo-dev-rg"
        subnet_name = "todo-dev-subnet2"
        virtual_network_name = "todo-dev-vnet"

    }
}
load_balancer = {
    load_balancer ={
        lb_name = "todo-dev-lb"
        lb_location = "centralindia"
        rg_name ="todo-dev-rg"
        ipconfig_name = "todo-dev-ipconfig"
        pip_name ="todo-dev-pip"    
    }
}
backend_pool = {
    backend_pool ={
        backendpool_name = "todo-dev-backendpool"
        lb_name = "todo-dev-lb"
        rg_name = "todo-dev-rg"
    }
}
health_probe = {
    health_probe ={
        health_probe_name = "todo-dev-healthprobe"
        lb_name = "todo-dev-lb"
        rg_name = "todo-dev-rg"
    }
}
lb_rule = {
    lb_rule ={

        lb_rule_name = "todo-dev-lbrule"
        ipconfig_name  = "todo-dev-ipconfig"
        lb_name = "todo-dev-lb"
        rg_name = "todo-dev-rg"
        backendpool_name = "todo-dev-backendpool"
        # health_probe_name = "todo-dev-healthprobe"
    }
}
vm ={
    vm={
        vm_name = "todo-dev-vm"
        rg_name = "todo-dev-rg"
        location = "central india"
        username = "adminuser"
        password = "Password@123"
        nic_name = "todo-dev-nic"
        custom_data = <<-EOF
        #!/bin/bash
        apt-get update -y
        apt-get install -y nginx git
        systemctl enable nginx
        systemctl start nginx
        rm -f /var/www/html/index.nginx-debian.html
        git clone https://github.com/devopsinsiders/starbucks-clone.git /tmp/starbucks-clone
        cp -r /tmp/starbucks-clone/* /var/www/html/
        chown -R www-data:www-data /var/www/html/
        systemctl restart nginx
        EOF        
    }
        vm2={
        vm_name = "todo-dev-vm2"
        rg_name = "todo-dev-rg"
        location = "central india"
        username = "adminuser2"
        password = "Password@123"
        nic_name = "todo-dev-nic2"
        custom_data = <<-EOF
        #!/bin/bash
        apt-get update -y
        apt-get install -y nginx git
        systemctl enable nginx
        systemctl start nginx
        rm -f /var/www/html/index.nginx-debian.html
        git clone https://github.com/Abhishek-pratap9120/paan-wala-next-gen.git /tmp/paan-wala-next-gen
        cp -r /tmp/paan-wala-next-gen/* /var/www/html/
        chown -R www-data:www-data /var/www/html/
        systemctl restart nginx
        EOF        
    }
    
}
nic_association = {
    nic_association ={
        nic_name = "todo-dev-nic"
        lb_name = "todo-dev-lb"
        rg_name = "todo-dev-rg"
        backendpool_name = "todo-dev-backendpool"
    }
        nic_association2 ={
        nic_name = "todo-dev-nic2"
        lb_name = "todo-dev-lb"
        rg_name = "todo-dev-rg"
        backendpool_name = "todo-dev-backendpool"
    }
}
subnet_association = {
    subnet_association ={
        subnet_name = "todo-dev-subnet"
        virtual_network_name = "todo-dev-vnet"
        rg_name = "todo-dev-rg"
        nsg_name = "todo-dev-nsg"
    }
        subnet_association2 ={
        subnet_name = "todo-dev-subnet2"
        virtual_network_name = "todo-dev-vnet"
        rg_name = "todo-dev-rg"
        nsg_name = "todo-dev-nsg"
    }
}