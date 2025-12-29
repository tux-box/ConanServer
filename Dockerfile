# Use a lightweight Ubuntu base image
FROM ubuntu:22.04

# Set environment variables to avoid interactive prompts
ENV DEBIAN_FRONTEND=noninteractive

# Install dependencies
RUN apt-get update && apt-get install -y wget curl unzip lib32gcc-s1 lib32stdc++6 software-properties-common && rm -rf /var/lib/apt/lists/*

# Install SteamCMD
RUN mkdir -p /opt/steamcmd && cd /opt/steamcmd && wget https://steamcdn-a.akamaihd.net/client/installer/steamcmd_linux.tar.gz && tar -xvzf steamcmd_linux.tar.gz && rm steamcmd_linux.tar.gz

# Set working directory
WORKDIR /conanexiles

# Expose necessary ports
# 7777 UDP = game port
# 7778 UDP = query port
# 27015 UDP = Steam query port
EXPOSE 7777/udp 7778/udp 27015/udp

# Copy server start script
COPY scripts/start_server.sh ./start_server.sh
RUN ls -la ./
RUN chmod +x /start_server.sh

# Start the server
CMD ["/start_server.sh"]
