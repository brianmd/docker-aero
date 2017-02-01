Creates two-node aerospike cluster:

```sh
$ docker-compose up
...  wait for the two instances to start
$ ./inserts.sh   # inserts to 172.18.0.2
$ ./selects.sh   # reads from 172.18.0.3
```

Note that this is tested against docker version 1.13.0 and docker-compose version 1.10.0.
Upgrade these first should you have problems.

etc-aero[12] are the config directories for the two instances. They are hard-coded
to ip address 172.18.0.2 and 172.18.0.3 respectively. These will be correct
if this is the first docker network that is created (other than the 3 default ones).

Should you get errors, use this command to show the proper subnet, which should replace
'172.18' in the config files:
```
$ docker network inspect aero_asnet
```

Lastly, the timeout is 1 second. I had a timeout issue with a really slow computer I own.
Typing 'set timeout 3000' in aql prior to the select statement overcame this error.

UPDATE: the timeout issue had to do with transparent huge pages. This is a known issue
with database-type applications on newer builds of Linux. Run this command to solve:
```sh
echo never > /sys/kernel/mm/transparent_hugepage/enabled
```

(Better yet, put in your rc.local file so it is set upon boot.)


