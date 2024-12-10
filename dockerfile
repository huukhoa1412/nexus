# Use an official lightweight image with Rust
FROM rust:latest

# Install required dependencies
RUN apt-get update && apt-get install -y \
    sudo \
    protobuf-compiler \
    libssl-dev \
    pkg-config \
    git \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Set the working directory
WORKDIR /app

# Copy the run script into the container
COPY run.sh /app/run.sh

# Ensure the script is executable
RUN chmod +x /app/run.sh

# Default command to execute the script
CMD ["./run.sh"]
