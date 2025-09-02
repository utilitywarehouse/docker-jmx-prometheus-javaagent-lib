FROM alpine:3.22 AS tmp

RUN --mount=type=cache,target=/var/cache/apk \
    apk add curl

ENV VERSION=1.4.0
ENV JAR=jmx_prometheus_javaagent-$VERSION.jar

RUN curl -L https://github.com/prometheus/jmx_exporter/releases/download/$VERSION/$JAR -o /lib/$JAR

FROM alpine:3.22
COPY --from=tmp /lib /lib
