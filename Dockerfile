FROM alpine:3.19

RUN apk add --no-cache ca-certificates

RUN addgroup -g 1000 synapse && \
    adduser -u 1000 -G synapse -s /bin/false -D synapse

ARG TARGETARCH
COPY synapse-node-linux-${TARGETARCH} /usr/local/bin/synapse-node
RUN chmod +x /usr/local/bin/synapse-node

RUN mkdir -p /data/node && chown synapse:synapse /data/node

USER synapse

EXPOSE 8200

ENTRYPOINT ["synapse-node"]
CMD ["--data-dir", "/data/node"]
