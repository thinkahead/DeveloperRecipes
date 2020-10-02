#!/usr/bin/python3

DOCUMENTATION = '''
---
module: flatten_variables

short_description: Get the flattened variable for hosts in the inventory
options:
  inventory:
    description:
      - Inventory
    type: dict
    required: true
  hosts:
    description:
      - List of host names
    type: list
    required: true
  inventory_id:
    description:
      - Inventory Id
    type: str
    required: true
'''
RETURN = '''
result:
    description: Result
    type: dict
    returned: always
'''

import time
from ansible.module_utils.basic import AnsibleModule
import requests
import base64
import json

def main():
    fields = {
        "inventory": {"type": "dict"},
        "hosts": {"type": "list"},
        "inventory_id": {"type": "str"}
    }
    module = AnsibleModule(argument_spec=fields)
    inventory  = module.params['inventory']
    hosts  = module.params['hosts']
    inventory_id  = module.params['inventory_id']
    #result={}
    #    result[attribute]=requests.get(url+attribute, proxies=proxies, verify=verify, headers={"Authorization": "Token token=\""+token+"\""}).content
    vars_for_hosts=get_vars_for_hosts_in_inventory(inventory,hosts,inventory_id)
    module.exit_json(changed=True, result=vars_for_hosts)

def copy_vars_to_child_groups(inventory,group_vars,group_name='all'):
    children=inventory.get(group_name,{}).get('children',[])
    for child in children:
        for k,v in group_vars[group_name].items(): group_vars[child][k]=v # Get collected vars from parent to child
        #print('Copying',child,inventory[child]['vars'])
        for k,v in inventory.get(child,{}).get('vars',{}).items(): group_vars[child][k]=v # Override collected vars in child with real child vars
        copy_vars_to_child_groups(inventory,group_vars,child)

def get_vars_for_host(inventory,group_vars,hostname):
    groups=[]
    for groupname in inventory.keys():
        if hostname in inventory.get(groupname,{}).get('hosts',[]): groups.append(groupname)
    groups.sort()
    #print(groups)
    host_vars={}
    for group in groups:
       #print("Collect from group_vars",group_vars[group])
       for k,v in group_vars[group].items(): host_vars[k]=v
    #print("Collect from host_vars",inventory["_meta"]["hostvars"][hostname])
    for k,v in inventory["_meta"]["hostvars"][hostname].items(): host_vars[k]=v
    return(host_vars)

def get_vars_for_hosts_in_inventory(inventory,hostnames,inventory_id):
    group_vars={}
    group_vars['all']=inventory['all']['vars']
    for child in inventory['all']['children']: group_vars[child]={}
    copy_vars_to_child_groups(inventory,group_vars)
    #print(group_vars)
    vars=[]
    for hostname in hostnames:
        vars_list=get_vars_for_host(inventory,group_vars,hostname)
        #vars.append({"inventory_id":inventory_id,'hostname':hostname,'vars':vars_list})
        vars.append({"spec":{"tower_credentials": [v for (k,v) in vars_list.items() if k.endswith("credential")],"tower_host":hostname,"tower_inventory":inventory_id},'vars':vars_list})
    return vars

if __name__ == '__main__':
    main()
