FROM node:6.3.0-onbuild

RUN \
  apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv EA312927 && \
  echo 'deb http://repo.mongodb.org/apt/debian wheezy/mongodb-org/3.2 main' | tee /etc/apt/sources.list.d/mongodb-org-3.2.list && \
  apt-get update && \
  apt-get install -y mongodb-org && \
  rm -rf /var/lib/apt/lists/*

RUN mkdir -p /usr/src/app

VOLUME ["/usr/src/app"]

VOLUME ["/data/db"]

EXPOSE 27017
EXPOSE 28017

RUN echo "#!/bin/bash\n" > /start.sh
RUN echo "service mongod start" >> /start.sh
RUN echo "npm install" >> /start.sh
RUN echo "npm start" >> /start.sh

RUN chmod +x /start.sh

WORKDIR /usr/src/app

ENTRYPOINT /start.sh
