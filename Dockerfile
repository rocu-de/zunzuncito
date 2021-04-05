FROM ruby:3.0-alpine
ENV RUBYOPT='-W0'
RUN apk --update add build-base mariadb-dev mariadb-client curl git nodejs tzdata libxslt-dev libxml2-dev imagemagick yarn

# Install Hugo
ENV HUGO_VERSION=0.74.3
RUN curl -SL https://github.com/gohugoio/hugo/releases/download/v${HUGO_VERSION}/hugo_${HUGO_VERSION}_Linux-64bit.tar.gz -o /tmp/hugo.tar.gz
RUN tar -xzf /tmp/hugo.tar.gz -C /tmp
RUN mv /tmp/hugo /usr/local/bin/
RUN rm -rf /tmp/*

# Download Hugo themes
RUN mkdir -p /hugo/themes/archie
RUN git clone https://github.com/athul/archie.git /hugo/themes/archie

WORKDIR /app
COPY . /app

RUN bundle install

EXPOSE 2300
ENTRYPOINT ["bundle", "exec"]
CMD ["bundle", "exec", "rails", "s"]
