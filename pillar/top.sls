prod:
  "*":
    - prod.packages
    - prod.default
    
  "web-prd*":
    - prod.apache

  "RH-K8S*":
    - prod.k8s.default
    - prod.k8s.packages

  "RH-K8S-MGR*":
    - prod.etcd
