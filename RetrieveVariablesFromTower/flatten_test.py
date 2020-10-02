def copy_vars_to_child_groups(inventory,group_vars,group_name='all'):
    children=inventory[group_name].get('children',[])
    for child in children:
        for k,v in group_vars[group_name].items(): group_vars[child][k]=v # Get collected vars from parent to child
        #print('Copying',child,inventory[child]['vars'])
        for k,v in inventory[child]['vars'].items(): group_vars[child][k]=v # Override collected vars in child with real child vars
        copy_vars_to_child_groups(inventory,group_vars,child)

def get_vars_for_host(inventory,group_vars,hostname):
    groups=[]
    for groupname in inventory.keys():
        if hostname in inventory[groupname].get('hosts',[]): groups.append(groupname)
    groups.sort()
    #print(groups)
    host_vars={}
    for group in groups:
       #print("Collect from group_vars",group_vars[group])
       for k,v in group_vars[group].items(): host_vars[k]=v
    #print("Collect from host_vars",inventory["_meta"]["hostvars"][hostname])
    for k,v in inventory["_meta"]["hostvars"][hostname].items(): host_vars[k]=v
    return(host_vars)

def get_vars_for_hosts_in_inventory(inventory,hostnames):
    group_vars={}
    group_vars['all']=inventory['all']['vars']
    for child in inventory['all']['children']: group_vars[child]={}
    copy_vars_to_child_groups(inventory,group_vars)
    #print(group_vars)
    vars={}
    for hostname in hostnames:
        vars[hostname]=get_vars_for_host(inventory,group_vars,hostname)
    return vars

#def get_parent_groups(inventory,child_group):
#    parent_groups=[]
#    for group in inventory.keys():
#        if child_group in inventory[group].get('children',[]): parent_groups.append(group)
#    return parent_groups

#def get_vars_for_hosts_in_inventory(inventory,hostnames):
#    for hostname in hostnames:
#        groups=[]
#        for group in inventory.keys():
#            if hostname in inventory[group].get('hosts',[]): groups.append(group)
#        print(hostname,groups)
#        for group in groups: print(get_parent_groups(inventory,group))

def main_inventory():
    inventory_name="A"
    inventory={
        "AA": {
            "children": [
                "AAB",
                "AAA",
                "AAC"
            ],
            "vars": {
                "testvar": "aa",
                "testvar_aa_children": "from_aa"
            }
        },
        "AAA": {
            "hosts": [
                "aa-host1.domainname.com",
                "aa-host2.domainname.com"
            ],
            "vars": {
                "testvar": "aaa",
                "testvar_onlyaaa": "aaa_only",
                "testvar_aaa_aab": "from_aaa"
            }
        },
        "AAB": {
            "hosts": [
                "aa-host1.domainname.com"
                #"aa-host2.domainname.com"
            ],
            "vars": {
                "testvar": "aab",
                "testvar_onlyaab": "aab_only",
                "testvar_aab_aac": "from_aab",
                "testvar_aaa_aab": "from_aab"
            }
        },
        "AAC": {
            "hosts": [
                #"aa-host1.domainname.com",
                "aa-host2.domainname.com"
            ],
            "vars": {
                "testvar": "aac",
                "testvar_aab_aac": "from_aac"
            }
        },
        "AB": {
            "children": [
                "ABA",
                "ABB",
                "ABC"
            ],
            "vars": {
                "testvar": "ab",
                "testvar_ab_children": "from_ab"
            }
        },
        "ABA": {
            "children": [
                "ABAA",
                "ABAB",
                "ABAC"
            ],
            "vars": {
                "testvar": "aba"
            }
        },
        "ABAA": {
            "hosts": [
                "ab-host2.domainname.com",
                "ab-host1.domainname.com"
            ],
            "vars": {
                "testvar": "abaa"
            }
        },
        "ABAB": {
            "hosts": [
                "ab-host2.domainname.com",
                "ab-host1.domainname.com"
            ],
            "vars": {
                "testvar": "abab"
            }
        },
        "ABAC": {
            "hosts": [
                "ab-host2.domainname.com",
                "ab-host1.domainname.com"
            ],
            "vars": {
                "testvar": "abac"
            }
        },
        "ABB": {
            "children": [
                "ABBA",
                "ABBB",
                "ABBC"
            ],
            "vars": {
                "testvar": "abb"
            }
        },
        "ABBA": {
            "hosts": [
                "ab-host2.domainname.com",
                "ab-host1.domainname.com"
            ],
            "vars": {
                "testvar": "abba"
            }
        },
        "ABBB": {
            "hosts": [
                "ab-host2.domainname.com",
                "ab-host1.domainname.com"
            ],
            "vars": {
                "testvar": "abbb"
            }
        },
        "ABBC": {
            "hosts": [
                "ab-host2.domainname.com",
                "abbc-host2.domainname.com",
                "ab-host1.domainname.com",
                "abbc-host1.domainname.com"
            ],
            "vars": {
                "testvar": "abbc"
            }
        },
        "ABC": {
            "hosts": [
                "ab-host2.domainname.com",
                "ab-host1.domainname.com"
            ],
            "vars": {
                "testvar": "abc",
                "testvar_ab_children": "ab_override"
            }
        },
        "_meta": {
            "hostvars": {
                "a-host1.domainname.com": {
                    "testvar": "a-host1"
                },
                "a-host2.domainname.com": {},
                "aa-host1.domainname.com": {
                    "testvar": "aa-host1"
                },
                "aa-host2.domainname.com": {},
                "ab-host1.domainname.com": {
                    "testvar": "ab-host1"
                },
                "ab-host2.domainname.com": {},
                "abbc-host1.domainname.com": {
                    "testvar": "abbc-host1"
                },
                "abbc-host2.domainname.com": {}
            }
        },
        "all": {
            "children": [
                "AA",
                "AAA",
                "AAB",
                "AAC",
                "AB",
                "ABA",
                "ABAA",
                "ABAB",
                "ABAC",
                "ABB",
                "ABBA",
                "ABBB",
                "ABBC",
                "ABC"
            ],
            "hosts": [
                "a-host1.domainname.com",
                "a-host2.domainname.com"
            ],
            "vars": {
                "testvar": "a",
                "testvar_all_children": "allvar",
            }
        }
    }
    #print(inventory)
    #print('all vars',inventory['all']['vars'])
    hostnames=["aa-host1.domainname.com","aa-host2.domainname.com","abbc-host1.domainname.com","abbc-host2.domainname.com","a-host1.domainname.com","a-host2.domainname.com"]
    vars_for_hosts=get_vars_for_hosts_in_inventory(inventory,hostnames)
    print(vars_for_hosts)

main_inventory()

