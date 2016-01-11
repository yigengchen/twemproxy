FROM openshift/base-centos7
RUN yum install telnet 
RUN yum install lsof 
RUN yum install make 
RUN yum install automake  
RUN yum install curl 
RUN yum install libtool
RUN yum install python2.7 
RUN yum install python-pip vim
RUN yum install -qy 
RUN yum install vim 
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
