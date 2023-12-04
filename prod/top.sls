prod:
  '*':
    - installPackage
    - hosts_file
    - selinux
    
  'web-prd*':
    - apache

  "RH-K8S*":
    - k8s.default
    - k8s.download
    - network_setup.add_route

  "RH-K8S-MGR*":
    - etcd

  "RH-K8S-WKR*":
    
## Defines an enviornment in Salt-Project, mandatory file for each Stack of states.
## Contains the Group-Names of Minions

