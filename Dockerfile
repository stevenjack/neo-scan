FROM nikolauska/phoenix:latest

ARG VERSION
ARG NEO_CLI_VERSION=2.5.2

LABEL maintainer="City of Zion"
LABEL authors="lucianoengel"
LABEL version=${VERSION}

ADD . /data
WORKDIR /data
RUN mix deps.get
RUN mix compile
WORKDIR /data/apps/neoscan_web/assets
RUN npm install
WORKDIR /data

EXPOSE 4000

ENTRYPOINT ["mix"]
CMD ["phx.server"]
