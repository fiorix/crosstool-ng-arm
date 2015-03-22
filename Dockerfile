# VERSION 0.1
# AUTHOR:	Alexandre Fiori <fiorix@gmail.com>
# DESCRIPTION:	crosstool-ng for arm (Raspberry Pi)
# BUILD:	docker build --rm -t fiorix/crosstool-ng-arm .

FROM ubuntu

RUN apt-get update
RUN apt-get install -y \
	autoconf \
	automake \
	binutils \
	bison \
	build-essential \
	curl \
	flex \
	gawk \
	gperf \
	libncurses5-dev \
	libtool \
	subversion \
	texinfo \
	tmux \
	unzip \
	wget

RUN curl -s http://crosstool-ng.org/download/crosstool-ng/crosstool-ng-1.20.0.tar.bz2 | tar -jx -C /usr/src
WORKDIR /usr/src/crosstool-ng-1.20.0
RUN ./configure --prefix=/opt/cross
RUN make
RUN make install

RUN mkdir /root/ct-ng-conf
WORKDIR /root/ct-ng-conf
COPY ct-ng-config /root/ct-ng-conf/.config
COPY ct-ng-env /usr/local/bin/ct-ng-env
RUN chmod 755 /usr/local/bin/ct-ng-env
RUN ct-ng-env ct-ng build
RUN rm -rf /root/ct-ng-conf/.build
RUN rm -f /root/ct-ng-conf/build.log
WORKDIR /
