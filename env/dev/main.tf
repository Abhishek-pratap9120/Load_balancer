module "resource_group" {
    source = "../../module/resource_group"
    resource_group = var.resource_group  
}

module "virtual_network" {
    depends_on = [ module.resource_group ]
    source = "../../module/virtual-network"
    virtual_network = var.virtual_network 
}
module "subnet" {
    source = "../../module/subnet"
    depends_on = [ module.virtual_network ]
    subnet = var.subnet  
}
module "nsg" {
    source = "../../module/nsg"
    depends_on = [ module.resource_group ]
    nsg =var.nsg
  
}
module "public_ip" {
    source = "../../module/public_ip"
    depends_on = [ module.resource_group ]
    public_ip = var.pip
  
}
module "nic" {
    source = "../../module/nic"
    depends_on = [ module.subnet,module.resource_group,module.public_ip ]
    nic = var.nic
  
}
module "load_balancer" {
    source = "../../module/load_balancer"
    depends_on = [ module.resource_group ,module.public_ip ]
    load_balancer = var.load_balancer
  
}
module "backend_pool" {
    source = "../../module/lb_backend_pool"
    depends_on = [ module.load_balancer ]
    backend_pool = var.backend_pool
  
}
module "health_probe" {
    source = "../../module/health_probe"
    depends_on = [ module.load_balancer ]
    health_probe = var.health_probe
  
}
module "lb_rule" {
    source = "../../module/load_balancer_rule"
    depends_on = [ module.backend_pool,module.load_balancer ]
    lb_rule = var.lb_rule
  
}
module "vm" {
    source = "../../module/virtual_machine"
    depends_on = [ module.resource_group,module.virtual_network,module.subnet,module.nic,module.public_ip ]
    vm=var.vm
  
}
module "nic_association" {
    source = "../../module/association"
    depends_on = [ module.nic,module.load_balancer,module.backend_pool ]
    nic_association = var.nic_association
  
}
module "subnet_association" {
    source = "../../module/subnet_association"
    depends_on = [ module.nsg, module.subnet ]
    subnet_association = var.subnet_association
  
}


