prod:
  "*":
    - prod.packages
    
  "web-prd*":
    - prod.apache

  "RH-K8S-MGR*":
    - prod.default
    - prod.k8s.packages
    - prod.etcd