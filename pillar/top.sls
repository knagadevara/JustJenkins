prod:
  "*":
    - prod.packages
    - prod.default
    
  "web-prd*":
    - prod.apache

  "RH-K8S*":
    - prod.k8s.packages
    - prod.k8s.default

  "RH-K8S-MGR*":
    - prod.etcd
