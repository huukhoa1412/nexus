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
# EXPORT REPO_PATH=$NEXUS_HOME/network-api

WORKDIR /root/.nexus/
# Clone the repository
RUN git clone https://github.com/nexus-xyz/network-api

# Change the working directory to the cloned repository
WORKDIR /root/.nexus/network-api 
RUN git -c advice.detachedHead=false checkout $(git rev-list --tags --max-count=1)

# /clients/cli
WORKDIR /root/.nexus/network-api/clients/cli
# Build the project
RUN cargo build --release
WORKDIR /root/
COPY ./run.sh ./run.sh
RUN chmod +x run.sh
# Run the application
CMD ["/root/run.sh"]