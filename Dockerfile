FROM ruby:2.5
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs
RUN mkdir /job_tweets
WORKDIR /job_tweets
COPY Gemfile /job_tweets/Gemfile
COPY Gemfile.lock /job_tweets/Gemfile.lock
RUN bundle install
COPY . /job_tweets