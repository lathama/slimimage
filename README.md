# Slim Image (slimimage) or Easier to use Distroless Containers

## About

Do you need a small safe container for an application to keep everyone happy from implementation to security teams? Remember, if there is nothing in the container than the security scanner can't find anything to report on. Have you tried `distroless` and wonder why the build system has to be so complex?

- Debian based (The idea could be duplicated on other distros)
- Download the packages, unpack them to a directory with base filesystem
- Tar up the base filesystem
- Import to Docker or other container tooling
- Win!


## Howto

On Debian Trixie (13)

``` bash
apt-get download base-files ca-certificates netbase libbz2-1.0 libc6 libdb5.3t64 libexpat1 libffi8 liblzma5 libncursesw6 libpython3.13-minimal libpython3.13-stdlib libreadline8t64 libsqlite3-0 libssl3t64 libtinfo6 libtirpc3t64 libuuid1 media-types openssl python3.13-minimal tzdata zlib1g
for f in *.deb; do dpkg -x $f basedir/; done
tar -C basedir -c . | docker import - slimimagepython
```

## Dogfooding

Building within a Docker build file.

``` bash
docker build . --target slimimagepython --tag slimimagepython
 --snip--
 => => naming to docker.io/lathama/slimimage:python
docker run -it slimimagepython
Python 3.13.5 (main, Jun 25 2025, 18:55:22) [GCC 14.2.0] on linux
Type "help", "copyright", "credits" or "license" for more information.
warning: can't use pyrepl: setupterm: could not find terminfo database; TERM=xterm
>>>
```

## Security and Layers

In the container world images can often have exessive layers and libraries that
both use up space. These layers can have a computational impact that increases
startup resource usage. These layers and size will also increase the security
scan time including false positives from unused libraries.

## Resources

- Distroless https://github.com/GoogleContainerTools/distroless
- https://github.com/lathama/slimimage


## Thanks

If you find this useful and want to say thanks I have options at:

- https://lathama.net/Thanks
