# Use a lightweight Alpine Linux base image
FROM alpine:latest

# Install required tools: 
# - ImageMagick: for image processing/resizing
# - Curl: to interact with the Immich API
# - Bash: to execute the script
RUN apk add --no-cache imagemagick curl bash

# Copy the resize script from the current folder to the container
COPY resize.sh /resize.sh

# Ensure the script is executable
RUN chmod +x /resize.sh

# Execute the script when the container starts
ENTRYPOINT ["/resize.sh"]
