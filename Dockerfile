FROM alpine:3.23
ARG UID=1000
ARG GID=1000

RUN apk add --no-cache streamlink && \
	addgroup --gid $GID -S streamlink && \
	adduser --uid $UID --ingroup streamlink --disabled-password --no-create-home --gecos "" --shell /bin/false streamlink

USER streamlink

ADD --chmod=644 --checksum=sha256:8406a5df4868498c3d2362e516b639b18f03e288040719af9e6e6696659cfef1 \
	https://github.com/2bc4/streamlink-ttvlol/releases/download/8.0.0-20251114/twitch.py /app/streamlink_plugins/twitch.py
COPY ./entrypoint.sh /app/entrypoint.sh
COPY ./streamlink.config /app/streamlink.config

ENTRYPOINT ["/app/entrypoint.sh"]
CMD ["jerma985","nyanners"]
