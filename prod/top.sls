prod:
  'k8s-*':
    - server-motd
    - web_admin

  'k8s-mgr-*':
    - apache
    - web_admin


## Defines an enviornment in Salt-Project, mandatory file for each Stack of states.
## Contains the Group-Names of Minions

