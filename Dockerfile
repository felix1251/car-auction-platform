FROM ruby:3.2.2

WORKDIR /app

# Install dependencies
RUN apt-get update && \
    apt-get install -y \
    build-essential \
    nodejs && \
    rm -rf /var/lib/apt/lists/*

ENV RAILS_ENV production
ENV RAILS_SERVE_STATIC_FILES true
ENV RAILS_LOG_TO_STDOUT true

# Install gems
COPY Gemfile Gemfile.lock ./
RUN bundle config --global frozen 1
RUN gem install bundler
RUN bundle install --without development test

COPY . .
# RUN rm -rf .env
RUN bundle exec rake assets:precompile

COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["bash","/usr/bin/entrypoint.sh"]

EXPOSE 3000
