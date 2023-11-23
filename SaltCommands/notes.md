## [Grains Module](https://docs.saltproject.io/en/latest/ref/grains/all/index.html)

Synxtax

    slat <'glob of minions'> grains.<sub command> <foo>:<baz>
        bar:
            f.o.o.r

- To get data from servers whith common glob, example a pool of _web-servers_

        salt 'web-prd-*' grains.get dns
            or
        salt 'web-prd-*' grains.get dns:ip4_nameservers

- To run on servers of a specific type by replacing glob with grains.

        salt -G 'os_family:Redhat' grains.get osfinger

- Targeting specifics nodes of similar type with compound query

        salt -C 'G@os_family:Redhat and G@osmajorrelease:8' grains.get osfullname 

- Add/Delete custom labels to nodes through grains.

        ADD:set salt '<minion_glob>' grains.set <key> <value>
        salt 'web-app-*' grains.set deployment-version 2023.11.3.D-17.WbFtX
        DELETE:delkey salt '<minion_glob>' grains.delkey <key>
        salt 'web-app-*' grains.delkey deployment-version

## [Execution Module](https://docs.saltproject.io/en/latest/ref/modules/all/index.html)

- To execute a remote command by using execution modules

        salt '<minion-glob*/grain.<data>>' <remote-module-function> <remote-argument>
        salt 'os_family:Ubuntu' service.status/start/stop/restart/enable/disable/enabled/disabled <'service-name'>
        salt 'web-fntd-*' service.status sshd.service
        salt 'os_family:Ubuntu' service.enabled sshd.service
        salt 'role:Web-Ft' user.chgroups <username> <group> append=True

- Some of remote-module-functions

        user.info  -> linux user information, if exists  
        group.info -> linux group information, if exists
        file.exists -> check if file exists

## [State Modules](https://docs.saltproject.io/en/latest/ref/modules/all/salt.modules.state.html#module-salt.modules.state)

    salt '<minion-glob*/grain.<data>>' state.<apply/pause/disable/enable/show_highstate> [test/pillar/mock]
    salt 'web-app*' state.show_highstate 
    salt 'osfamily:Ubuntu' state.apply test=true

## [Pillar Module](https://docs.saltproject.io/en/latest/ref/pillar/all/index.html)

    

