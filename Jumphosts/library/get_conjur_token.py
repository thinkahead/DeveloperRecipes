#!/usr/bin/python3

DOCUMENTATION = '''
---
module: get_conjur_token

short_description: Get the uri result
options:
  url:
    description:
      - URL
    type: str
    required: true
  data:
    description:
      - Body
    type: str
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
        "data": {"type": "str"},
        "proxies": {"type": "dict"},
        "verify": {"type": "bool"}
    }
    module = AnsibleModule(argument_spec=fields)
    url  = module.params['url']
    data  = module.params['data']
    proxies  = module.params['proxies']
    verify  = module.params['verify']
    r=requests.post(url, proxies=proxies, data=data, verify=verify)
    module.exit_json(changed=True, content=r.content, status_code=r.status_code)

if __name__ == '__main__':
    main()
