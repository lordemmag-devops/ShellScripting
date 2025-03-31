#!/bin/bash

# GitHub settings (REPLACE THESE!)
GITHUB_TOKEN="ghp_your_real_token_here"  # No extra spaces!
OWNER="your_exact_github_username_or_org"  # Case-sensitive!
REPO="your_exact_repository_name"          # Case-sensitive!

# API URL
API_URL="https://api.github.com/repos/$OWNER/$REPO/collaborators"

# Fetch collaborators
response=$(curl -s -H "Authorization: token $GITHUB_TOKEN" \
                 -H "Accept: application/vnd.github.v3+json" "$API_URL")

# Check for errors
if [[ "$(echo "$response" | jq -r '.message')" == "Bad credentials" ]]; then
    echo "❌ ERROR: Invalid GitHub token or permissions."
    echo "👉 Generate a new token with proper scopes: https://github.com/settings/tokens"
    exit 1
elif [[ "$(echo "$response" | jq -r '.message')" == "Not Found" ]]; then
    echo "❌ ERROR: Repository not found. Check OWNER/REPO names."
    exit 1
fi

# Success: List collaborators
echo "✅ Users with access to $OWNER/$REPO:"
echo "$response" | jq -r '.[].login'
