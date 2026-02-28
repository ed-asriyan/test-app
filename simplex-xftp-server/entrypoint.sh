#!/bin/sh

# Options from HA config
ADDR=$(jq -r '.addr' /data/options.json)
PORT=$(jq -r '.port' /data/options.json)
QUOTA=$(jq -r '.quota' /data/options.json)
PASS=$(jq -r '.pass // ""' /data/options.json)
EXPIRE_FILES_HOURS=$(jq -r '.expire_files_hours' /data/options.json)
NEW_FILES=$(jq -r 'if .new_files then "on" else "off" end' /data/options.json)

# Define directories
CONFIG_DIR=/etc/opt/simplex-xftp
STATE_DIR=/var/opt/simplex-xftp
FILES_DIR=/srv/xftp
INI=${CONFIG_DIR}/file-server.ini

# Symlink data directories so HA backs them up
mkdir -p /data/config /data/state /data/files
[ -L "$CONFIG_DIR" ] || { rm -rf "$CONFIG_DIR" && ln -s /data/config "$CONFIG_DIR"; }
[ -L "$STATE_DIR"  ] || { rm -rf "$STATE_DIR"  && ln -s /data/state  "$STATE_DIR";  }
[ -L "$FILES_DIR"  ] || { rm -rf "$FILES_DIR"  && ln -s /data/files  "$FILES_DIR";  }

# Initialize certificates on first run (generates TLS certs and fingerprint)
if [ ! -f "$INI" ]; then
    case "$ADDR" in
        *[a-zA-Z]*) xftp-server init --store-log --path "$FILES_DIR" --fqdn "$ADDR" --quota "$QUOTA" ;;
        *)          xftp-server init --store-log --path "$FILES_DIR" --ip   "$ADDR" --quota "$QUOTA" ;;
    esac
fi

# Render config from scratch on every start
if [ -n "$PASS" ]; then
    CREATE_PASSWORD_LINE="create_password = ${PASS}"
else
    CREATE_PASSWORD_LINE=""
fi
export ADDR PORT QUOTA EXPIRE_FILES_HOURS NEW_FILES FILES_DIR CREATE_PASSWORD_LINE
envsubst < /file-server.ini.tpl > "$INI"

# Print server address
FINGERPRINT=$(cat "${CONFIG_DIR}/fingerprint" 2>/dev/null || true)
if [ -n "$FINGERPRINT" ]; then
    echo "=========================================="
    echo "XFTP server address:"
    echo "xftp://${FINGERPRINT}@${ADDR}:${PORT}"
    echo "=========================================="
fi

exec xftp-server start +RTS -N -RTS
