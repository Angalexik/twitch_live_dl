#!/bin/sh

# TODO: Replace this with something that's not a shell script
while true; do
	for channel in "$@"; do
		saved_channel_pid=$(eval echo '$'pid_"$channel")
		channel_pid=${saved_channel_pid:-undefined}
		if ! kill -0 "$channel_pid" 2>/dev/null; then
			echo "[$channel] [Main Script] Attempting to start streamlink"
			streamlink \
				--config /app/streamlink.config \
				--config /config/user_config.config \
				--logformat "[$channel] [streamlink] [{name}][{levelname}] {message}" \
				--output "/download/$channel/({time:%Y-%m-%dT%H%M%z}) {title} [{id}].mkv" \
				"https://twitch.tv/$channel" &
			eval "pid_$channel='$!'"
		else
			echo "[$channel] [Main Script] Streamlink is running"
		fi
	done
	sleep 60s
done
