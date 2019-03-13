FROM ruby:2.6.1-alpine as builder

RUN apk update && apk upgrade

RUN apk --update add --no-cache \
  build-base \
  ca-certificates \
  git \
  postgresql-dev \
  tzdata

ENV TZ UTC
RUN mkdir /app
WORKDIR /app

COPY Gemfile Gemfile.lock ./
RUN gem install bundler
RUN bundle install --jobs 20 --retry 5

# Target image
FROM ruby:2.6.1-alpine

RUN apk update && apk upgrade

RUN apk --update add --no-cache \
  ca-certificates \
  postgresql-dev \
  tzdata \
  nodejs

ENV TZ UTC

WORKDIR /app
COPY --from=builder $GEM_HOME $GEM_HOME
COPY . /app
RUN bin/rails assets:precompile

ENTRYPOINT ["./bin/docker-entrypoint.sh"]
CMD ["bin/rails", "server", "-b", "0.0.0.0"]
