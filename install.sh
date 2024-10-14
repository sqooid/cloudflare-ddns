#!/bin/bash

logrotate_config="/etc/logrotate.d/cloudflare-ddns"
if [ -f "${logrotate_config}" ]; then
  echo "Log rotate config ${logrotate_config} already exists"
  exit 1
fi

dir=$(cd $(dirname 0) && pwd)

log_path="/var/log/cloudflare-ddns.log"
sudo touch "${log_path}" && sudo chmod 666 "${log_path}"


# Install log rotate
cat << EOF | sudo tee "${logrotate_config}"
${log_path} {
  daily
  rotate 1
}
EOF

# Install crontab
(crontab -l 2>/dev/null; echo "*/5 * * * * cd ${dir} && ./run.sh >> /var/log/cloudflare-ddns.log 2>&1") | crontab -