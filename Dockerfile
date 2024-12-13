FROM alpine:3.21

RUN apk add --no-cache streamlink

ADD --checksum=sha256:59bc4b364c46eb80659df23f4706393746ea1243bf0fabb5e2760cc93baf78df \
	https://github.com/2bc4/streamlink-ttvlol/releases/download/7.0.0-20241105/twitch.py /streamlink_plugins/twitch.py
COPY ./entrypoint.sh /entrypoint.sh
COPY ./streamlink.config /streamlink.config

ENTRYPOINT ["/entrypoint.sh"]
CMD ["jerma985","nyanners"]
