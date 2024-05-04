#!/bin/bash

# Definer variabler
REPO_PATH="."  # Opdateret sti
IMAGE_NAME="nodejs-hello-world"
REGISTRY="docker.io"
USERNAME="aggerholm"
COMMIT_HASH=""

# Skift til Git repo directory
cd $REPO_PATH

# Tjek om vi er i et Git repo
if git rev-parse --git-dir > /dev/null 2>&1; then
    COMMIT_HASH=$(git rev-parse --short HEAD)
else
    echo "Fejl: Kan ikke hente Git commit-hash. Kontroller at dette script kører i et Git repository."
    exit 1
fi

FULL_IMAGE_NAME="$USERNAME/$IMAGE_NAME:$COMMIT_HASH"

# Log ind på Docker
echo "Logger ind på Docker..."
echo "$DOCKER_PASSWORD" | docker login -u "$USERNAME" --password-stdin

# Byg Docker image
echo "Bygger Docker image..."
docker build -t $IMAGE_NAME .

# Tag Docker image
echo "Tagger Docker image..."
docker tag $IMAGE_NAME $REGISTRY/$FULL_IMAGE_NAME

# Push Docker image
echo "Uploader Docker image til Docker registry..."
docker push $REGISTRY/$FULL_IMAGE_NAME

if [ $? -ne 0 ]; then
    echo "Docker push mislykkedes, afslutter..."
    exit 1
fi

echo "Script fuldført succesfuldt!"

