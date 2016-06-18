# Honeypots

Packaging honeypots for small communities with joint Situational Awareness.

* **WHAT**: Easy to deploy and to keep updated honeypots with Situational Awareness.
* **WHY**: Because we can! And because previous boxes, software and os installs are
getting old.
* **TO WHOM**: OUSPG-alumnis and affiliates who have been running honeypots.
* **HOW**: Dockerify latest.

## Kippo

Kippo is now obsolete in our use, see [our old instructions](https://docs.google.com/document/d/1alb60WiWMzghZlApgfqfh5LF2mjn-U0Nm8WeKcPD-hI/edit).

## Cowrie

Replaces old patched up Kippo in our use.

### Running directly from the Docker Hub

A prebuild container image is available from the
[Docker Hub](https://hub.docker.com/r/nkapu/kippo/).

```
docker run -d -p 2222:2222 --name cowrie nkapu/cowrie
```

### Building in a cloned repository

```
git clone https://github.com/ouspg/honeypots.git
cd honeypots/cowrie
docker build -t cowrie --rm .
```

### Building directly from the GitHub

```
docker build -t cowrie --rm https://github.com/ouspg/honeypots.git#:cowrie
```

### Publishing on the Docker Hub

Based on the instructions from:
https://docs.docker.com/mac/step_six/

```
docker images
docker tag <imageid> nkapu/cowrie:latest
docker login
docker push nkapu/cowrie
```

### Running self-built locally

```
docker run -ti -p 2222:2222 --rm cowrie
```

### Running on the DigitalOcean

 * First choose create droplet
 * Then choose Docker from One-click apps section
 * Choose hostname and create your machine

```
# apt-get update  
#
```

### Running on the Amazon Web Services (AWS)

### Running on the Google Cloud Platform

## Alpine cowrie vs Ubuntu kippo
```
kippo  latest b83a55e14965   16 seconds ago 393.1 MB
cowrie latest 0852a1044ab8   2 minutes ago  115 MB
```
## References

* http://threatstream.github.io/mhn/
* https://jordan-wright.github.io/blog/2015/05/11/60-days-of-watching-hackers-attack-elasticsearch/
* http://turbochaos.blogspot.fi/2013/05/attacking-kippo.html
* https://isc.sans.edu/forums/diary/Kippo+Users+Beware+Another+fingerprinting+trick/18119/
* http://morris.guru/detecting-kippo-ssh-honeypots/
* https://groups.google.com/forum/#!topic/kippousers/PpZGKVKNawI
* https://b.kentbackman.com/2011/07/23/kippo-ssh-honeypot-on-rhel-6-centos-6/
* https://www.digitalocean.com/community/articles/how-to-install-kippo-an-ssh-honeypot-on-an-ubuntu-cloud-server
* https://code.google.com/p/kippo/wiki/MakingKippoReachable
* https://github.com/micheloosterhof/kippo
* http://honeyn3t.ie/?p=1342
* http://kitrule.blogspot.fi/2012/03/kippo-ssh-honeypot-on-ubuntu-1104.html
* Other honeypot repos
* https://github.com/vensder/alpine-kippo/blob/master/Dockerfile
* https://github.com/micheloosterhof/cowrie
* https://github.com/desaster/kippo
