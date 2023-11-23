prod:
  '*':
    - prod.default
    - prod.ssh_users

  "web-prd*":
    - prod.apache