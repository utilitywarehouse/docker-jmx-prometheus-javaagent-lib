FROM alpine:3.22 AS tmp

RUN --mount=type=cache,target=/var/cache/apk \
    apk add curl

ENV VERSION=1.0.1
ENV JAR=jmx_prometheus_javaagent-$VERSION.jar

RUN curl -L https://repo1.maven.org/maven2/io/prometheus/jmx/jmx_prometheus_javaagent/$VERSION/$JAR -o /lib/$JAR

FROM scratch
COPY --from=tmp /lib /lib
