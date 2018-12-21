FROM dlanguage/dmd:2.079.0

RUN apt-get update \
 && apt-get install -y --no-install-recommends libcurl4-gnutls-dev libevent-dev libssl-dev \
 && apt-get clean && rm -rf /var/lib/apt/lists/* /var/cache/apt \
 && dub upgrade
 
ADD /jsontree/. /

WORKDIR /
EXPOSE 80

CMD [ "dub", "run", "--build=release" ]