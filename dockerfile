# create a Jekyll container from a Ruby Alpine image

# Ruby 2.7 is required to support Jekyll with GitHub pages
FROM --platform=linux/arm64 ruby:2.7-alpine

# Add Jekyll dependencies to Alpine
RUN apk update
RUN apk add --no-cache build-base gcc cmake git

WORKDIR /site
COPY . .

# Update the Ruby bundler and install Jekyll
RUN gem update --system
RUN gem update bundler && gem install bundler jekyll

# Uncomment after site is built
# RUN bundle install

EXPOSE 4000