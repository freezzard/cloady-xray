#!/bin/sh
set -e
: "${UUID:?UUID env var is required}"
WSPATH="${WS_PATH:-/stream}"
PORT="${PORT:-8080}"
cat > /usr/local/xray/config.json << JSON
{
  "log": { "loglevel": "warning" },
  "inbounds": [
    {
      "listen": "0.0.0.0",
      "port": ${PORT},
      "protocol": "vless",
      "settings": {
        "clients": [ { "id": "${UUID}" } ],
        "decryption": "none"
      },
      "streamSettings": {
        "network": "ws",
        "wsSettings": { "path": "${WSPATH}" }
      }
    }
  ],
  "outbounds": [ { "protocol": "freedom", "tag": "direct" } ]
}
JSON
echo "xray starting on port ${PORT} path ${WSPATH}"
exec /usr/local/xray/xray run -config /usr/local/xray/config.json
