# Slim Image (slimimage) or Easier to use Distroless Containers

## About

Do you need a small safe container for an application to keep everyone happy from implementation to security teams? Remember, if there is nothing in the container than the security scanner can't find anything to report on. Have you tried `distroless` and wonder why the build system has to be so complex?

- Debian based (The idea could be duplicated on other distros)
- Download the packages, unpack them to a directory with base filesystem
- Tar up the base filesystem
- Import to Docker or other container tooling
- Win!


## Howto

``` bash
apt-get download base-files ca-certificates netbase libbz2-1.0 libc6 libdb5.3 libexpat1 libffi8 liblzma5 libncursesw6 libpython3.11-minimal libpython3.11-stdlib libreadline8 libsqlite3-0 libssl3 libtinfo6 libtirpc3 libuuid1 media-types openssl python3.11-minimal tzdata zlib1g
for f in *.deb; do dpkg -x $f basedir/; done
tar -C basedir -c . | docker import - slimimage
```

## Dogfooding

Building within a Docker build file.

``` bash
docker build . --target slimimagepython
 --snip--
 => => naming to docker.io/lathama/slimimage:python
docker run -it slimimage
Python 3.11.2 (main, Mar 13 2023, 12:18:29) [GCC 12.2.0] on linux
Type "help", "copyright", "credits" or "license" for more information.
>>> exit()
```

## Resources

- https://hub.docker.com/repository/docker/lathama/slimimage/general
- https://lathama.net/git/lathama/Dockerfiles/src/branch/master/slimimage/README.md
- Distroless https://github.com/GoogleContainerTools/distroless
- https://github.com/lathama/slimimage
