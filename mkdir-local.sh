#!/usr/bin/env bash

# DIR_NAME="foo"
CARGO_PATH="/usr/local/cargo"
CONTAINTER_PATH="/usr/local/cargo/containers"
CRATE_PATH="/usr/local/cargo/crates"
BIN="/usr/local/bin"
# Create the directory under /usr/local with group ownership set to "admin"
sudo mkdir $CARGO_PATH
sudo mkdir $CONTAINTER_PATH
sudo mkdir $CRATE_PATH
sudo chown -R "$USER":admin "$CARGO_PATH"

# Check if the directory was created, group ownership was set, and owner was changed successfully
if [ $? -eq 0 ]; then
  echo "Directory '$CARGO_PATH' created successfully under /usr/local with group ownership set to 'admin' and owner changed to '$USER'"
else
  echo "Failed to create directory '$CARGO_PATH', set group ownership to 'admin', or change owner to '$USER'"
fi

mv cargoctl $BIN
if [ $? -eq 0 ]; then
  echo "Cargo installed successfully under $BIN"
else
  echo "Failed to install cargo under $BIN"
fi
