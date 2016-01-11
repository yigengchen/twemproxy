FROM openshift/base-centos7
RUN yum install -y telnet 
RUN yum install -y lsof 
RUN yum install -y make 
RUN yum install -y automake  
RUN yum install -y curl 
RUN yum install -y libtool
RUN yum install -y python2.7 
RUN yum install -y python-pip
RUN yum install -y -qy
RUN yum install -y vim 
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
