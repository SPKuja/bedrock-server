FROM ubuntu:bionic

# Install necessary packages and clean up to reduce image size
RUN apt-get update && \
    apt-get install -y unzip curl libcurl4 libssl1.1 && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Download the Minecraft Bedrock server with a specific user-agent
RUN curl -H 'User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36' \
    --silent \
    --output bedrock-server.zip \
    https://www.minecraft.net/bedrockdedicatedserver/bin-linux/bedrock-server-1.21.31.04.zip

# Unzip and set up the server
RUN unzip bedrock-server.zip -d bedrock-server && \
    chmod +x bedrock-server/bedrock_server && \
    rm bedrock-server.zip

# Set working directory
WORKDIR /bedrock-server

# Set the library path
ENV LD_LIBRARY_PATH=.

# Expose the server port
EXPOSE 19132/udp

# Run the Minecraft Bedrock server
CMD ["./bedrock_server"]
