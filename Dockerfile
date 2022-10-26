FROM ruby:3.0.4

RUN apt-get update && apt-get install -y nodejs npm

WORKDIR /app
COPY . .
RUN bundle install
RUN npm install pspdfkit

CMD ["rails", "server", "-p", "3000", "-b", "0.0.0.0"]
