FROM alpine
RUN apk --update add curl \
	&& mkdir -p /cron/ \
	&& mkdir -p /run.d/ \
	&& mkdir -p /func.d/
ADD ./script/func/* /func.d/
ADD ./script/set.sh /run/set.sh
VOLUME [ "/run.d" ]
ENTRYPOINT /run/set.sh
