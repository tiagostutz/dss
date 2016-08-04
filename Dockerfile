FROM ubuntu:xenial

RUN  apt-get update \
  && apt-get install -y wget \
  && apt-get install -y curl \
  && apt-get install -y  libexpat1 \
  && apt-get install -y  nginx-full \
  && apt-get install -y  default-jre-headless \
  && apt-get install -y  python2.7 \
  && apt-get install -y  libpython2.7 \
  && apt-get install -y  libpng12-0 \
  && apt-get install -y  libfreetype6 \
  && apt-get install -y  libgfortran3 \
  && apt-get install -y  libgomp1 \
  && rm -rf /var/lib/apt/lists/*

RUN useradd -ms /bin/bash dss

USER dss

WORKDIR /home/dss

RUN mkdir app && mkdir install

RUN cd install

RUN wget http://downloads.dataiku.com/public/studio/3.1.0/dataiku-dss-3.1.0.tar.gz

RUN tar xzf dataiku-dss-3.1.0.tar.gz

WORKDIR dataiku-dss-3.1.0

RUN ls

RUN ./installer.sh -d /home/dss/app -p 11000

CMD ["/bin/bash"]
CMD ["/home/dss/app/bin/dss", "start"]
