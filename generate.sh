#!/bin/bash

# Check if both arguments are provided
if [[ $# -ne 2 ]]; then
  echo "Error: Two arguments required"
  echo "Usage: $0 VERSION BLOCKCHAIN"
  echo "Example: $0 2.5.0 dymension"
  exit 1
fi

# Assign positional arguments
RELEASE_VERSION="$1"
BLOCKCHAIN="$2"

# Validate semantic versioning format (X.Y.Z)
if ! [[ "$RELEASE_VERSION" =~ ^[0-9]+\.[0-9]+\.[0-9]+$ ]]; then
  echo "Error: Version must follow semantic versioning format (X.Y.Z)"
  echo "Example: 2.5.0"
  exit 1
fi

echo "Generating docker-compose.yml with:"
echo "  RELEASE_VERSION: $RELEASE_VERSION"
echo "  BLOCKCHAIN: $BLOCKCHAIN"

# Create docker-compose.yml from template
sed "s/RELEASE_VERSION/$RELEASE_VERSION/g; s/BLOCKCHAIN/$BLOCKCHAIN/g" docker-compose.yml.tpl > docker-compose.yml

echo "docker-compose.yml has been generated successfully."
