#!/bin/bash

REPO_PATH="."
IMAGE_NAME="nodejs-hello-world"
REGISTRY="docker.io"
USERNAME="aggerholm"
COMMIT_HASH=""

# Skift til Git repo directory
cd $REPO_PATH

# Tjek om vi er i et Git repo
if git rev-parse --git-dir > /dev/null 2>&1; then # > 2>&1 /dev/null betyder at at fejlmeddelelser ignoreres (sendes til null)
    # COMMIT_HASH = sidste commit tag, fra git repo
    COMMIT_HASH=$(git rev-parse --short HEAD)
else
    echo "Fejl: Kan ikke hente Git commit-hash. Kontroller at dette script kører i et Git repository."
    exit 1
fi

# Dette vil eksempelvis blive: aggerholm/nodejs-hello-world/5899edd
FULL_IMAGE_NAME="$USERNAME/$IMAGE_NAME:$COMMIT_HASH"

# Log ind på Docker, med password fra github secret
echo "Logger ind på Docker..."
echo "$DOCKER_PASSWORD" | docker login -u "$USERNAME" --password-stdin

echo "Bygger Docker image..."
docker build -t $IMAGE_NAME .

echo "Tagger Docker image..."
docker tag $IMAGE_NAME $REGISTRY/$FULL_IMAGE_NAME

echo "Uploader Docker image til Docker registry..."
docker push $REGISTRY/$FULL_IMAGE_NAME

if [ $? -ne 0 ]; then # $? -ne 0, betyder at hvis den sidste kørte kommando er fejlet, altså har returneret en fejlbesked, køres koden efter "then".
    echo "Docker push mislykkedes, afslutter..."
    exit 1
fi

# Ingen fejl opstået, så er script fuldført!
echo "Script fuldført succesfuldt!"

