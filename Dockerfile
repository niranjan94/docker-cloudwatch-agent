FROM gliderlabs/alpine:latest

COPY cron /var/spool/cron/crontabs/root
COPY aws-scripts-mon /aws-scripts-mon
COPY docker-entrypoint.sh /usr/bin/docker-entrypoint
WORKDIR /aws-scripts-mon

RUN apk add --update perl perl-libwww perl-datetime-timezone perl-datetime perl-sys-syslog && rm -rf /var/cache/apk/* && \
    chmod +x /aws-scripts-mon/mon-put-instance-data.pl && \
    chmod +x /usr/bin/docker-entrypoint

ENTRYPOINT docker-entrypoint