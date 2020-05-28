FROM centos:8.1.1911

ARG ruby_version=2.7.0

RUN yum update -y && \
    yum install -y \
    make \
    git \
    bzip2 \
    epel-release \
    gcc-c++ \
    openssl-devel

RUN git clone https://github.com/rbenv/rbenv.git ~/.rbenv
RUN echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bashrc
RUN echo 'eval "$(rbenv init -)"' >> ~/.bashrc

RUN git clone https://github.com/rbenv/ruby-build.git ~/.rbenv/plugins/ruby-build
RUN echo 'export PATH="$HOME/.rbenv/plugins/ruby-build/bin:$PATH"' >> ~/.bashrc

RUN /bin/bash -l -c "rbenv install ${ruby_version}"
RUN /bin/bash -l -c "rbenv global ${ruby_version}"
RUN /bin/bash -l -c "gem install bundler"
RUN /bin/bash -l -c "gem install middleman"
