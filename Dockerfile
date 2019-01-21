FROM ruby

COPY . /shopify

WORKDIR /shopify

RUN apt-get update && apt-get install -y build-essential libpq-dev nodejs sqlite3


RUN gem update --system && gem install bundler && gem install rails -v 5.1.4 && bundle install

CMD ["rails", "server", "-p" , "80", "-b", "0.0.0.0"]


