from __future__ import (absolute_import, division, print_function)
__metaclass__ = type

DOCUMENTATION = """
  lookup: conjur_vault
  author: Alexei Karve <karve(at)us.ibm.com>
  version_added: "2.0"
  short_description: retrieve secrets from Conjur vault
  description:
    - retrieve secrets from Conjur vault
  options:
    token:
      description: vault token.
    target_hosts:
      description: target_hosts for which we want to retrieve attributes.
      default: None
    attributes:
      description: variables to retrieve.
      default: ['ssh_user','ssh_passphrase','ssh_private_key']
    proxies:
      description: Socks proxies.
      default: proxies={"http":"socks5h://localhost:1234","https":"socks5h://localhost:1234"}
    url:
      description: URL to vault service.
    verify:
      description: controls verification and validation of SSL certificates, only want to turn off with self signed ones.
      type: boolean
      default: True
"""

EXAMPLES = """
- debug:
    msg: "{{ lookup('conjur_vault', 'secret=secret/hello:value token=c975b780-d1be-8016-866b-01d0f9b688a5 url=http://myvault:8200')}}"

"""

RETURN = """
_raw:
  description:
    - secrets(s) requested
"""

import os
import json
import requests

from ansible.errors import AnsibleError
from ansible.module_utils.parsing.convert_bool import boolean
from ansible.plugins.lookup import LookupBase

class LookupModule(LookupBase):
    def run(self, terms, variables=None, **kwargs):
        vault_args = terms[0].split()
        vault_dict = {}
        ret = []

        for param in vault_args:
            try:
                key, value = param.split('=',1)
            except ValueError:
                raise AnsibleError("conjur_vault lookup plugin needs key=value pairs, but received %s" % param)
            vault_dict[key] = value

        url = vault_dict['url']
        token = vault_dict['token']
        if vault_dict.get('target_hosts'): target_hosts = json.loads(vault_dict['target_hosts'])
        else: target_hosts=None
        if vault_dict.get('attributes'): attributes  = json.loads(vault_dict['attributes'])
        else: attributes = ['ssh_user','ssh_passphrase','ssh_private_key']
        if vault_dict.get('proxies'): proxies = json.loads(vault_dict['proxies'])
        else: proxies={"http":"socks5h://localhost:1234","https":"socks5h://localhost:1234"}
        verify=vault_dict.get('verify',True)
        if target_hosts is None or len(target_hosts)==0:
            result={}
            for attribute in attributes:
                result[attribute]=requests.get(url+"-"+attribute, proxies=proxies, verify=False, headers={"Authorization": "Token token=\""+token+"\""}).content
            ret.append(result)
        else:
            results={}
            for target_host in target_hosts:
                result={}
                for attribute in attributes:
                    result[attribute]=requests.get(url+"-"+target_host+"-"+attribute, proxies=proxies, verify=False, headers={"Authorization": "Token token=\""+token+"\""}).content
                results[target_host]=result
            ret.append(results)
        ret.append(url)
        ret.append(target_hosts)
        ret.append(attributes)
        return ret
