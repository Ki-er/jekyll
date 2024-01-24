# Muitistage Dockerfile to first build the static site, then using nginx serve the static site
FROM --platform=linux/arm64 ruby:3.1.3 as builder
WORKDIR /usr/src/app
COPY Gemfile .
RUN bundle install
COPY . .
RUN JEKYLL_ENV=production bundle exec jekyll build

