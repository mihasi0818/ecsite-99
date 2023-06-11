FROM ruby:3.1.4

RUN apt-get update -qq && \
    apt-get install -y build-essential \
                       libpq-dev \
                       nodejs \
                       vim

RUN mkdir /test3

WORKDIR /test3

ADD Gemfile /test3/Gemfile
ADD Gemfile.lock /test3/Gemfile.lock

RUN gem install bundler
RUN bundle install

ADD . /test3

RUN mkdir -p tmp/sockets
RUN mkdir -p tmp/pids
