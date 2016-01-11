FROM ubuntu:15.10
RUN apt-get update
RUN apt-get install telnet lsof libtool make automake  curl python2.7 
RUN apt-get install -y python-pip -qy vim
ENV TIME_ZONE=Asia/Shanghai
RUN ln -snf /usr/share/zoneinfo/$TIME_ZONE /etc/localtime && echo $TIME_ZONE > /etc/timezone
RUN mkdir -p /src/twemproxy
COPY . /src/twemproxy
WORKDIR /src/twemproxy
RUN cd  /src/twemproxy
RUN autoreconf -fvi & ./configure --enable-debug=log & make
EXPOSE 9000
ADD start.sh /start.sh
RUN chmod a+x start.sh
CMD ./start.sh
