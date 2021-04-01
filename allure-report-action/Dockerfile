#FROM openjdk:8-jre-alpine
FROM openjdk:17-alpine3.13

ARG RELEASE=2.13.9
RUN echo $RELEASE
ARG ALLURE_REPO=https://repo.maven.apache.org/maven2/io/qameta/allure/allure-commandline

#RUN apk update
#RUN apk add bash
#RUN apk add wget
#RUN apk add unzip

RUN wget --no-verbose -O /tmp/allure-$RELEASE.zip $ALLURE_REPO/$RELEASE/allure-commandline-$RELEASE.tgs \
  && tar /tmp/allure-$RELEASE.zip -d / \
  && rm -rf /tmp/*

#RUN rm -rf /var/cache/apk/*

RUN chmod -R +x /allure-$RELEASE/bin

ENV ROOT=/app
ENV PATH=$PATH:/allure-$RELEASE/bin

RUN mkdir -p $ROOT

WORKDIR $ROOT
COPY ./entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]