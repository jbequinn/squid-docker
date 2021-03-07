FROM alpine:3.13

RUN apk upgrade
RUN apk add --update --no-cache squid apache2-utils tzdata

RUN touch /etc/squid/passwords
RUN chown squid:squid /etc/squid/passwords

ADD entrypoint.sh /
ADD squid.conf /etc/squid/squid.conf

USER squid
ENTRYPOINT ["/entrypoint.sh"]