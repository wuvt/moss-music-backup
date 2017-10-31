# moss-music-backup Dockerfile
# Dustin "giggybyte" Smith

# Using Ubuntu. Don't tell the LUUG.
FROM ubuntu

# Set working directory
WORKDIR /app

# Add the files necessary to run the script.
ADD archive     /app
ADD rclone      /app
ADD rclone.conf /app

# Give this container a name
ENV NAME moss-music-backup-script
#ENV http_proxy socks5://172.17.0.1:8123
#ENV https_proxy socks5://172.17.0.1:8123

# Install curl and jq
RUN apt-get -y update && apt-get -y upgrade && apt-get -y install curl jq

# This is what will be called with `docker run`.
CMD ["bash", "archive", "dws2175", "wuvt-test-folder"]
