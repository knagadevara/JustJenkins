prod:
  '*':
    - installPackage
    - hosts_file
    - selinux
    
  'web-prd*':
    - apache

  "RH-K8S*":
    - k8s.default
    - network_setup.add_route

  "RH-K8S-MGR*":
    - k8s.master
    - k8s.worker
    - etcd

  "RH-K8S-WKR*":
    - k8s.worker
    
## Defines an enviornment in Salt-Project, mandatory file for each Stack of states.
## Contains the Group-Names of Minions

