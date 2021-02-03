FROM ubuntu:18.04

ARG VERSION=v2.14.1
ENV VERSION=${VERSION}

RUN apt-get update && apt-get install -y curl
RUN mkdir -p mongodb-bi \
 && cd mongodb-bi \
 && curl https://info-mongodb-com.s3.amazonaws.com/mongodb-bi/v2/mongodb-bi-linux-x86_64-ubuntu1804-${VERSION}.tgz | tar xzf - --strip-components 1 \
 && mv bin/* /usr/local/bin/ \
 && cd .. \
 && rm -fr mongodb-bi
ADD start.sh /scripts/start.sh
CMD /scripts/start.sh
USER 2000
