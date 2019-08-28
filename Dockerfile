FROM kubesphere/builder-base:latest

RUN yum -y groupinstall 'Development Tools'  && yum -y clean all --enablerepo='*'

ENV GOLANG_VERSION 1.12.9

RUN wget https://golang.org/dl/go$GOLANG_VERSION.linux-amd64.tar.gz && \
  tar -C /usr/local -xzf go$GOLANG_VERSION.linux-amd64.tar.gz && \
  rm go${GOLANG_VERSION}.linux-amd64.tar.gz

ENV PATH $PATH:/usr/local/go/bin
ENV PATH $PATH:/usr/local/
ENV GOROOT /usr/local/go
ENV GOPATH=/home/jenkins/go
ENV PATH $PATH:$GOPATH/bin

RUN mkdir -p $GOPATH/bin && mkdir -p $GOPATH/src && mkdir -p $GOPATH/pkg

CMD ["go","version"]
