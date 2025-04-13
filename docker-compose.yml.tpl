---
version: "3.8"
name: "crynux_node"

services:
  crynux_node:
    image: ghcr.io/crynux-ai/crynux-node:RELEASE_VERSION-BLOCKCHAIN
    container_name: crynux_node
    restart: unless-stopped
    ports:
      - "127.0.0.1:7412:7412"
    volumes:
      - huggingface_cache_vol:/app/tmp/huggingface
      - external_cache_vol:/app/tmp/external
      - "./config:/app/config"
    deploy:
      resources:
        reservations:
          devices:
            - driver: nvidia
              count: all
              capabilities: [gpu]

volumes:
  huggingface_cache_vol:
  external_cache_vol: