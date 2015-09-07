FROM ruby:2.2

ENV PATH /usr/src/app/bin:$PATH

RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

COPY Gemfile cold-boot.gemspec /usr/src/app/
RUN bundle install

COPY . /usr/src/app
