#!/usr/bin/python3

DOCUMENTATION = '''
---
module: group_dict

short_description: group by dict keys

options:
  items:
    description:
    - items list of dictionaries
    type: list
  keys:
    description:
    - list of keys to search within subfield
    type: list
  subfield:
    description:
    - subfield in items
    type: str
'''
RETURN = '''
grouped_items:
    description: The output grouped_items that the module generates
    type: list
    returned: always
'''

from ansible.module_utils.basic import AnsibleModule
from itertools import groupby

def mysorted(l):
  return tuple(i for i in sorted(l)) if isinstance(l, list) else l

def myitemgetter(*items):
    if len(items) == 1:
        item = items[0]
        def g(obj):
            return mysorted(obj[item])
    else:
        def g(obj):
            return tuple(mysorted(obj[item]) for item in items)
    return g

def main():
    fields = {
        "items": {"type": "list"},
        "keys": {"type": "list"},
        "subfield": {"type": "str"},
    }

    module = AnsibleModule(argument_spec=fields)

    items = module.params['items']
    subfield = module.params['subfield']
    if subfield!="": items=[item[subfield] for item in items]
    keys = module.params['keys']

    grouper = myitemgetter(*keys)
    grouped_items = []
    for key, grp in groupby(sorted(items, key=grouper), grouper):
        temp_dict = dict(zip(keys, key))
        temp_dict["tower_host"] = [item["tower_host"] for item in grp]
        grouped_items.append(temp_dict)

    result={}
    result['changed'] = True
    result['grouped_items'] = grouped_items
    module.exit_json(**result)

if __name__ == '__main__':
    main()
