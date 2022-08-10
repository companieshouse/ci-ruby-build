FROM amazonlinux:2

ARG ruby_version=2.7.1

RUN yum update -y && \
    yum install -y \
    make \
    git \
    bzip2 \
    epel-release \
    gcc-c++ \
    openssl-devel \
    wget \
    unzip

RUN wget https://cache.ruby-lang.org/pub/ruby/2.7/ruby-${ruby_version}.zip
RUN unzip ruby-${ruby_version}.zip
RUN ./ruby-${ruby_version}/configure
RUN make
RUN make install

RUN /bin/bash -l -c "gem install bundler"
RUN /bin/bash -l -c "gem install middleman"
