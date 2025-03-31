#!/bin/bash

# Ensure the token is set
if [ -z "$GITHUB_TOKEN" ]; then
    echo "Error: GITHUB_TOKEN is not set. Export it before running the script."
    exit 1
fi

# GitHub settings
OWNER="your_org_or_username"
REPO="your_repository_name"
API_URL="https://api.github.com/repos/$OWNER/$REPO/collaborators"

# Fetch API response
response=$(curl -s -H "Authorization: Bearer $GITHUB_TOKEN" \
                 -H "Accept: application/vnd.github.v3+json" "$API_URL")

# Check if response is empty
if [ -z "$response" ]; then
    echo "Error: Empty response from GitHub API"
    exit 1
fi

# Check if response is valid JSON
if ! echo "$response" | jq empty >/dev/null 2>&1; then
    echo "Error: Invalid JSON response"
    exit 1
fi

# Check for error messages in the response
if echo "$response" | jq -e 'has("message")' >/dev/null; then
    echo "Error: $(echo "$response" | jq -r '.message')"
    exit 1
fi

# Extract and list user logins
echo "$response" | jq -r '.[].login'
