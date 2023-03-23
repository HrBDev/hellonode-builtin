#!/bin/bash

cd /tmp
wget https://github.com/v2fly/v2ray-core/releases/download/v5.3.0/v2ray-linux-64.zip
unzip -o v2ray-linux-64.zip

cat > config.json << EOF
{
  "inbounds": [{
    "port": $PORT,
    "listen": "0.0.0.0",
    "protocol": "vmess",
    "settings": { "clients": [{ "id": $UUID, "alterId": 0 }] },
    "streamSettings": { "network": "ws", "wsSettings": { "path": $URL } }
  }],
  "outbounds": [{ "protocol": "freedom", "settings": {} }]
}
EOF

./v2ray run >/dev/null 2>&1