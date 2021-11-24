#!/bin/bash -ue

HOSTNAME=$(curl -4 -s ifconfig.co/json | python3 -c "import json; a = open('/dev/stdin').read(); print('.'.join(json.loads(a).get('hostname', 'N/A').split('.')[-2:]) if '\"ip\":' in a else 'offline')")
echo "$HOSTNAME"
