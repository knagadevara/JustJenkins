prod:

  'web-prd*':
    - apache

  "RH-K8S-MGR*":
    - k8s.master
    - etcd

  "RH-K8S-MGR*":
    - k8s.worker
    
## Defines an enviornment in Salt-Project, mandatory file for each Stack of states.
## Contains the Group-Names of Minions

