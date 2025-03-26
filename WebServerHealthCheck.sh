#!/bin/bash

URL="https://example.com"
EMAIL="admin@example.com"

if ! curl -s --head --request GET "$URL" | grep "200 OK" > /dev/null; then
    echo "Website $URL is down!" | mail -s "Website Down Alert" "$EMAIL"
fi

