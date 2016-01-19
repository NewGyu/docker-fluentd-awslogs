FROM fluent/fluentd:latest
USER fluent
WORKDIR /home/fluent
ENV FLUENTD_PORT=22424
EXPOSE $FLUENTD_PORT
RUN gem install fluent-plugin-cloudwatch-logs
