FROM alpine:latest AS build

RUN apk --no-cache add make cmake gcc g++ git pkgconf
RUN git clone https://github.com/3cky/mbusd.git /usr/src
RUN cd /usr/src && cmake . && make

FROM alpine:latest
LABEL maintainer "Raman Shyshniou <rommer@ibuffed.com>"
COPY --from=build /usr/src/mbusd /sbin/mbusd
COPY entrypoint.sh /entrypoint.sh
RUN apk --no-cache add tini
ENTRYPOINT [ "/sbin/tini", "--", "/entrypoint.sh" ]

EXPOSE 502
