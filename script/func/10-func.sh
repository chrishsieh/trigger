#!/usr/bin/env ash

set -e
set -u
set -o pipefail

add_cron() {
	local cron_setting="${1}"
	local cron_Name="${2}"
	local trigger_URL="${3}"

	cat << EOF > "/cron/${cron_Name}.sh"
	curl --header "Content-Type:application/json" --data '{"build": true}' -X POST "${trigger_URL}"
EOF
	chmod +x "/cron/${cron_Name}.sh"
	echo "${cron_setting} /cron/${cron_Name}.sh" >> /etc/crontabs/root
	echo "Add Cron job ${cron_Name}"
}
