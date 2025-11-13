#!/bin/bash

IMAGE="skmadello/test-app:latest"
CONTAINER_NAME="test-app"
PORT="8501"

while true; do
    echo "🔍 Checking for updates..."

    # Pull the latest image
    docker pull $IMAGE

    # Stop the old container if exists
    if docker ps -a --format '{{.Names}}' | grep -Eq "^$CONTAINER_NAME$"; then
        echo "🛑 Stopping old container..."
        docker stop $CONTAINER_NAME || true
        docker rm $CONTAINER_NAME || true
    fi

    # Start new container
    echo "🚀 Starting new container..."
    docker run -d \
        --name $CONTAINER_NAME \
        -p $PORT:$PORT \
        $IMAGE

    echo "⏳ Waiting 30 seconds before checking again..."
    sleep 30
done
