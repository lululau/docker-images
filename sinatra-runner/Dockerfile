FROM ruby:2
RUN gem install sinatra puma faraday
COPY sinatra-run /usr/bin/
ENTRYPOINT ["sinatra-run"]
EXPOSE 80
