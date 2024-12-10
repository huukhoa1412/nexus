# Project README

## Overview
This project uses Docker Compose to set up and run the necessary services. Please follow the instructions below to get started.

## Prerequisites
- Docker
- Docker Compose

## Setup

1. Clone the repository:
    ```sh
    git clone https://github.com/huukhoa1412/nexus
    cd nexus
    ```

2. Open the `docker-compose.yml` file and fill in the `PROVER_ID` environment variable with your specific ID. You can obtain your `PROVER_ID` by accessing [Nexus](https://beta.nexus.xyz/).

    ```yaml
    version: '3.8'
    services:
      app:
        environment:
          - PROVER_ID=<your-prover-id>
    ```

3. Save the changes to the `docker-compose.yml` file.

## Running the Application

1. Build and start the services:
    ```sh
    docker-compose up --build
    ```


## Stopping the Application

To stop the services, run:
```sh
docker-compose down
```

## Troubleshooting

If you encounter any issues, please refer to the documentation or open an issue on the repository.
