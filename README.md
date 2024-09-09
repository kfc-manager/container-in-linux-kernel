# DEMO

## CGROUP

Enter root-cgroup folder:

```bash
cd /sys/fs/cgroup
```

Get PID of current shell:

```bash
echo $$
```

Get cgroup of current shell:

```bash
sudo cat /proc/<shell_pid>/cgroup
```

Get into cgroup:

```bash
cd <cgroup_path>
```

Print pid limit:

```bash
sudo cat pids.max
```

Get into root cgroup:

```bash
cd /sys/fs/cgroup
```

Create own sub-cgroup:

```bash
sudo mkdir test && cd test
```

Get PID of current shell:

```bash
echo $$
```

Add current shell process to the cgroup:

```bash
sudo nvim cgroup.procs
```

Set maximum pids in cgroup to 10:

```bash
sudo nvim pids.max
```

Spawn sleep process to demonstrate the limit being enforced:

```bash
sleep infinity &
```

Print out PIDS in cgroup:

```bash
sudo cat cgroup.procs
```

## NAMESPACES

Create PID namespace:

```bash
sudo unshare --pid --fork bash
```

Mount /proc:

```bash
mount -t proc none /proc
```

Show process at PID 1:

```bash
ps
```

Exit shell:

```bash
exit
```

Unmount again:

```bash
mount -t proc proc /proc
```

Show that namespace no longer exists since init process was exited:

```bash
sudo lsns | grep bash
```

## OVERLAY FILESYSTEM

Show filesystem:

```bash
sudo ls -l /var/lib/docker/overlay2
```

Build container:

```bash
sudo docker build -t test .
```

Show filesystem again:

```bash
sudo ls -l /var/lib/docker/overlay2
```

Show layers:

```bash
sudo ls -l /var/lib/docker/overlay2/<layer_sha>/diff
```

Modify image:

```bash
nvim Dockerfile
```

Build image again:

```bash
sudo docker build -t test2 .
```

Show new layers:

```bash
sudo ls -l /var/lib/docker/overlay2
```

Show content of new layers... and that ubunut layer is only once

## DOCKER

```bash
ifconfig
```

Start Nginx container:

```bash
sudo docker --name test -d nginx
```

Show not running on localhost:

```bash
curl localhost
```

Start shell in container:

```bash
sudo docker exec -it test bin/bash
```

Install net tools:

```bash
apt-get install net-tools
```

List network interfaces:

```bash
ifconfig
```

Take Ip address of eth0 and do curl there:

```bash
curl <ip_address_container>
```
