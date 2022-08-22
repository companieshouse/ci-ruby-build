FROM amazonlinux:2

ARG ruby_major_version=2
ARG ruby_minor_version=7
ARG ruby_patch_version=1
ARG ruby_version=${ruby_major_version}.${ruby_minor_version}.${ruby_patch_version}

RUN yum update -y && \
    yum install -y \
    make \
    git \
    bzip2 \
    epel-release \
    gcc-c++ \
    openssl-devel \
    wget \
    unzip && \
    yum clean all

RUN mkdir /tmp/ruby-source
RUN wget https://cache.ruby-lang.org/pub/ruby/${ruby_major_version}.${ruby_minor_version}/ruby-${ruby_version}.zip -P /tmp/ruby-source
RUN unzip /tmp/ruby-source/ruby-${ruby_version}.zip -d /tmp/ruby-source
RUN ./tmp/ruby-source/ruby-${ruby_version}/configure
RUN make
RUN make install
RUN rm /tmp/ruby-source -fr

RUN /bin/bash -l -c "gem install bundler"
RUN /bin/bash -l -c "gem install middleman"
