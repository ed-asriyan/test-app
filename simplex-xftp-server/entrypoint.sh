#!/bin/sh

export ADDR=$(jq -r '.addr' /data/options.json)
export QUOTA=$(jq -r '.quota' /data/options.json)
export PASS=$(jq -r '.pass // ""' /data/options.json)
PORT=$(jq -r '.port' /data/options.json)

# Symlink data directories so HA backs them up
mkdir -p /data/config /data/state /data/files
[ -L /etc/opt/simplex-xftp ] || { rm -rf /etc/opt/simplex-xftp && ln -s /data/config /etc/opt/simplex-xftp; }
[ -L /var/opt/simplex-xftp ] || { rm -rf /var/opt/simplex-xftp && ln -s /data/state /var/opt/simplex-xftp; }
[ -L /srv/xftp ]             || { rm -rf /srv/xftp && ln -s /data/files /srv/xftp; }

exec /usr/local/bin/entrypoint &
XFTP_PID=$!

# Wait for init to complete (config file appears)
i=0
while [ ! -f /etc/opt/simplex-xftp/fingerprint ] && [ $i -lt 30 ]; do
    sleep 1
    i=$((i + 1))
done

if [ -f /etc/opt/simplex-xftp/fingerprint ]; then
    FINGERPRINT=$(cat /etc/opt/simplex-xftp/fingerprint 2>&1)
    echo "=========================================="
    echo "XFTP server address:"
    echo "xftp://${FINGERPRINT}@${ADDR}:${PORT}"
    echo "=========================================="
fi

wait $XFTP_PID
