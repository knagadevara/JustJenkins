prod:
  '*':
    - ssh_users
    - server-motd

  'web-prd*':
    - apache

## Defines an enviornment in Salt-Project, mandatory file for each Stack of states.
## Contains the Group-Names of Minions

