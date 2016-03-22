# Salt Master

_Docker image for a [Salt](http://saltstack.com/) Master._

## Run

You *have* to expose the ports so minions can
communicate with the master.

    docker run \
      -d \
      --name=salt-master \
      -p 4505:4505 \
      -p 4506:4506 \
      mckaynz/salt-master

## Use

This will drop you into a shell in the salt master,
so you can use the `salt` command to manage machines:

    docker exec -it salt-master bash

## Volumes

The following volumes are defined:

- /etc/salt/master.d - Contains master configuration
- /etc/salt/pki - Private keys of the master and managed machines
- /srv/salt - Your salt states
- /var/cache/salt
- /var/logs/salt

## Log level

To change the log level, pass a different command:

    docker run --options... mckaynz/salt-master --log-level=debug

The default is `error`.

