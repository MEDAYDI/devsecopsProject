#!/bin/bash
set -e

# Check if TRIVY_GITHUB_TOKEN is set
if [ -z "$TRIVY_GITHUB_TOKEN" ]; then
    echo "Error: TRIVY_GITHUB_TOKEN is not set."
    exit 1
fi

dockerImageName="mohamedaydi/serverback:v1"
echo "Image name: $dockerImageName"

docker run --rm -v $WORKSPACE:/root/.cache/ -e TRIVY_GITHUB_TOKEN="$TRIVY_GITHUB_TOKEN" aquasec/trivy:0.17.2 -q image --exit-code 1 --severity CRITICAL --light "$dockerImageName"

exit_code=$?
echo "Exit Code: $exit_code"

if [[ "$exit_code" == 1 ]]; then
    echo "Image scanning failed. Vulnerabilities found."
    exit 1
else
    echo "Image scanning passed. No CRITICAL vulnerabilities found."
fi
