FROM alpine:3.21
ARG UID=1000
ARG GID=1000

RUN apk add --no-cache streamlink && \
	addgroup --gid $GID -S streamlink && \
	adduser --uid $UID --ingroup streamlink --disabled-password --no-create-home --gecos "" --shell /bin/false streamlink

USER streamlink

ADD --chmod=644 --checksum=sha256:59bc4b364c46eb80659df23f4706393746ea1243bf0fabb5e2760cc93baf78df \
	https://github.com/2bc4/streamlink-ttvlol/releases/download/7.0.0-20241105/twitch.py /app/streamlink_plugins/twitch.py
COPY ./entrypoint.sh /app/entrypoint.sh
COPY ./streamlink.config /app/streamlink.config

ENTRYPOINT ["/app/entrypoint.sh"]
CMD ["jerma985","nyanners"]
