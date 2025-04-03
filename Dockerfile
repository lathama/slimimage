# https://lathama.net/Tech/Basics/Container

FROM docker.io/debian:stable AS buildenv
LABEL version="0.1" description="Minimal Slim Image" maintainer="Andrew Latham lathama@gmail.com"
ENV LANG C.UTF-8
ENV DEBIAN_FRONTEND noninteractive
WORKDIR /tmp
RUN mkdir basedir
RUN apt-get update
RUN apt-get download base-files ca-certificates netbase libbz2-1.0 libc6 libdb5.3 libexpat1 libffi8 liblzma5 libncursesw6 libpython3.11-minimal libpython3.11-stdlib libreadline8 libsqlite3-0 libssl3 libtinfo6 libtirpc3 libuuid1 media-types openssl python3.11-minimal tzdata zlib1g
RUN for f in *.deb; do dpkg -x $f basedir/; done

FROM scratch AS slimimagepython
COPY --from=buildenv /tmp/basedir /
ENTRYPOINT ["/usr/bin/python3.11"]
