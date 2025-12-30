FROM alpine:3.23
ARG UID=1000
ARG GID=1000

RUN apk add --no-cache streamlink && \
	addgroup --gid $GID -S streamlink && \
	adduser --uid $UID --ingroup streamlink --disabled-password --no-create-home --gecos "" --shell /bin/false streamlink

# The chmod=755 isn't because the file itself needs to be executable, but because the directory that the file is in needs to be executable and chmod=644 would also apply to the parent directory *sigh*
ADD --chmod=755 --checksum=sha256:8406a5df4868498c3d2362e516b639b18f03e288040719af9e6e6696659cfef1 \
	https://github.com/2bc4/streamlink-ttvlol/releases/download/8.0.0-20251114/twitch.py /app/streamlink_plugins/twitch.py
COPY --chmod=755 ./entrypoint.sh /app/entrypoint.sh
COPY --chmod=644 ./streamlink.config /app/streamlink.config

USER streamlink

ENTRYPOINT ["/app/entrypoint.sh"]
CMD ["jerma985","nyanners"]
