# Honeypots

Packaging honeypots for small communities with joint Situational Awareness.

* **WHAT**: Easy to deploy and to keep updated honeypots with Situational Awareness.
* **WHY**: Because we can! And because previous boxes, software and os installs are
getting old.
* **TO WHOM**: OUSPG-alumnis and affiliates who have been running honeypots.
* **HOW**: Dockerify latest.

## Kippo

Kippo is now obsolete in our use, see [our old instructions](kippo/).

## Cowrie

Replaces old patched up Kippo in our use.

### Running locally directly from the Docker Hub

A prebuild container image is available from the
[Docker Hub](https://hub.docker.com/r/ouspg/cowrie/).

```sh
docker run -d -p 2222:2222 --name cowrie ouspg/cowrie
```

See e.g. the DigitalOcean example below on how to replace host
ssh-service with the honeypot.

### Building in a cloned repository

```sh
git clone https://github.com/ouspg/honeypots.git
cd honeypots/cowrie
docker build -t cowrie --rm .
```

### Building directly from the GitHub

```sh
docker build -t cowrie --rm https://github.com/ouspg/honeypots.git#:cowrie
```

### Publishing manually on the Docker Hub (stable)

Stable builds are published manually based on the
[Tag, push, and pull your image](https://docs.docker.com/mac/step_six/)
instructions.

```sh
docker images
docker tag <imageid> ouspg/cowrie:stable
docker login
docker push ouspg/cowrie
```

### Publishing automatically on the Docker Hub (latest)

Latest builds are published automatically based on the
[Automated Builds on Docker Hub](https://docs.docker.com/docker-hub/builds/)
instructions.

### Running locally based on self-built image

```sh
docker run -ti -p 2222:2222 --rm cowrie
```

See e.g. the DigitalOcean example below on how to replace host
ssh-service with the honeypot.

### Running on the DigitalOcean

 * First choose create droplet
 * Then choose Docker from One-click apps section
 * Choose hostname and create your machine

```sh
# apt-get update
# apt-get upgrade
# cd /etc/ssh
# cp sshd_config sshd_config.orig
# nano sshd_config
# diff sshd_config.orig sshd_config
5c5
< Port 22
---
> Port 7799
# service ssh reload
# docker run -d -p 22:2222 --name cowrie ouspg/cowrie
# docker logs cowrie
Starting cowrie with extra arguments [--nodaemon] ...
```

### Running on the Amazon Web Services (AWS)

TBD

### Running on the Google Cloud Platform

TBD

## (Kippo vs. Cowrie) vs. (Ubuntu vs. Alpine)

[Cowrie honeypot](http://www.micheloosterhof.com/cowrie/) is a fork of the
[Kippo honeypot](https://github.com/desaster/kippo) with active
development and at the time of this evaluation Cowrie had critical additional
functionality such as SFTP/SCP/SSH-exec support and seemed to be less often
automatically detected as a honeypot than Kippo.

Although Docker is not a perfect security sandbox it, if properly used,
provides some additional isolation via namespaces and `seccomp`-policies.
Furthermore Docker makes deploying small services such as this very
easy compared to the more manual methods we used before.

Most popular Docker packaged versions of the Kippo and Cowrie have been made by
[DTAG Community Honeypot Project](http://dtag-dev-sec.github.io) of
Deutsche Telekom AG. They and majority of the other Kippo and Cowrie images
in the Docker Hub are based on the Ubuntu image. Since we aimed for
very light weight deployment we chose Alpine. Some comparison the most popular
versions and the Alpine versions on the Docker Hub are given below based on
situation at the end of June 2016. At this time there were 18 Kippo images and 9
Cowrie images in the Docker Hub. If we counted correct, only one of them used
Alpine for the Kippo and only one for the Cowrie, before ours.

| Docker Hub Image     | Base Image     | Pulls | Image Size |
| -------------------  | -------------- | ----- | ---------- |
| dtagdevsec/kippo     | ubuntu:14.04.3 | 10k+  | 461.9 MB   |    
| dariusbakunas/kippo  | debian:wheezy  | 3.5k  | 384.1 MB   |
| vensder/alpine-kippo | alpine         | 29    | 81.13 MB   |
| dtagdevsec/cowrie    | ubuntu:14.04.4 | 3.9k  | 462.6 MB   |
| ouspg/cowrie         | alpine:latest  | 4     | 96.21 MB   |
| vimagick/cowrie      | alpine         | 529   | 98.94 MB   |

Please dind some naive "build time" comparison, please note that only the
*real* time matters since the build takes place in a remote Docker engine.

Standard disclaimer applies here, we are somewhat comparing apples
and oranges due to lack of feature parity.

```sh
% time docker build --no-cache -t kippo https://github.com/thomasleveil/docker-kippo.git
...
Successfully built 699733b66151

real	3m10.624s
user	0m0.315s
sys	0m0.135s

% time docker build --no-cache -t cowrie https://github.com/dtag-dev-sec/cowrie.git
...
Successfully built adfbd5e129e9

real	3m28.518s
user	0m0.649s
sys	0m0.406s

% time docker build -t cowrie --rm https://github.com/ouspg/honeypots.git#:cowrie
...
Successfully built 7e63227201d4

real	2m32.697s
user	0m0.237s
sys	0m0.218s
```

## Further Work

 * [ ] Achieve feature parity with Situational Awareness we had over the Kippo instances

## Additional References

* http://threatstream.github.io/mhn/
* http://dtag-dev-sec.github.io
* https://jordan-wright.github.io/blog/2015/05/11/60-days-of-watching-hackers-attack-elasticsearch/
* http://turbochaos.blogspot.fi/2013/05/attacking-kippo.html
* https://isc.sans.edu/forums/diary/Kippo+Users+Beware+Another+fingerprinting+trick/18119/
* http://morris.guru/detecting-kippo-ssh-honeypots/
* https://groups.google.com/forum/#!topic/kippousers/PpZGKVKNawI
* https://www.digitalocean.com/community/articles/how-to-install-kippo-an-ssh-honeypot-on-an-ubuntu-cloud-server
* http://kitrule.blogspot.fi/2012/03/kippo-ssh-honeypot-on-ubuntu-1104.html
* Other honeypot repos
 * https://github.com/desaster/kippo
 * https://github.com/micheloosterhof/cowrie
 * https://github.com/vensder/alpine-kippo/blob/master/Dockerfile
 * https://github.com/vimagick/dockerfiles/tree/master/cowrie
