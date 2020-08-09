#!/usr/bin/python3

DOCUMENTATION = '''
---
module: get_conjur_variables

short_description: Get the uri result
options:
  url:
    description:
      - URL
    type: str
    required: true
  token:
    description:
      - Token
    type: dict
    required: true
  attributes:
    description:
      - Attributes
    type: list
    required: true
  proxies:
    description:
      - Proxies
    type: dict
    required: true
  verify:
    description:
      - Verify
    type: bool
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
        "url": {"type": "str"},
        "token": {"type": "str"},
        "attributes": {"type": "list"},
        "proxies": {"type": "dict"},
        "verify": {"type": "bool"}
    }
    module = AnsibleModule(argument_spec=fields)
    url  = module.params['url']
    token  = module.params['token']
    attributes  = module.params['attributes']
    proxies  = module.params['proxies']
    verify  = module.params['verify']
    result={}
    for attribute in attributes:
        result[attribute]=requests.get(url+attribute, proxies=proxies, verify=verify, headers={"Authorization": "Token token=\""+token+"\""}).content
    module.exit_json(changed=True, result=result)

if __name__ == '__main__':
    main()
