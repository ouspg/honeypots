# Honeypots
Packaging honeypots for small communities with joint Situational Awareness

### WHAT
Honeypot with Situational Awareness is easy to deploy honeypot.

### WHY
Because we can! And because boxes, software and os are getting old.

### TO WHOM
OUSPG-alumnis and affiliates who have been running honeypot.

### HOW
Dockerify

## Installing kippo-with-sa

### Kippo-with-sa in dockerhub
https://hub.docker.com/r/nkapu/kippo/
```
docker pull nkapu/kippo
docker run -d -p 2222:2222 --name kippo
```
### Digitalocean
* First choose create droplet
* Then choose Docker from One-click apps section
* Choose hostname and create your machine
```
# apt-get update  
#
```

### Amazon Web Services

### Google cloud platform

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
