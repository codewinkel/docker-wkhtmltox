FROM node:0.12
MAINTAINER Mike Winkelmann <mikedotwinkelmann@gmail.com>

ENV HOMEDIR=/tmp

WORKDIR ${HOMEDIR}

RUN apt-get update
RUN apt-get install -y xfonts-base
RUN apt-get install -y xfonts-75dpi
RUN apt-get install -y xserver-common
RUN apt-get install -y openssl
RUN apt-get install -y ruby

COPY ./Makefile ${HOMEDIR}

ENV WKHTMLTOX_FILENAME=wkhtmltox-0.12.3_linux-generic-amd64.tar.xz
RUN curl -SLO http://download.gna.org/wkhtmltopdf/0.12.3/0.12.3/${WKHTMLTOX_FILENAME}
RUN tar xf w${WKHTMLTOX_FILENAME}
ENV PATH="${HOMEDIR}/wkhtmltox/bin:${PATH}"

RUN npm install -g inliner

RUN gem install mustache

CMD ["make"]
