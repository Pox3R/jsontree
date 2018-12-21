FROM dlanguage/dmd:2.079.0
EXPOSE 80
ADD jsontree /
RUN apt-get update  && apt-get install -y --no-install-recommends libcurl4-gnutls-dev libevent-dev libssl-dev  && apt-get clean && rm -rf /var/lib/apt/lists/* /var/cache/apt  && dub upgrade
WORKDIR /
CMD ["dub", "run", "--build=release"]
