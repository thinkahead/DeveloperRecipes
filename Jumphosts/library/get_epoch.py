#!/usr/bin/python3

DOCUMENTATION = '''
---
module: get_epoch

short_description: Get the epoch

'''
RETURN = '''
epoch:
    description: Epoch
    type: int
    returned: always
'''

import time
from ansible.module_utils.basic import AnsibleModule

def main():

    fields = {
    }

    module = AnsibleModule(argument_spec=fields)

    result=int(time.time())
    module.exit_json(changed=True, epoch=result)

if __name__ == '__main__':
    main()
