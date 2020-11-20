#!/bin/bash

# Get dependencies ready
mix deps.get
mix deps.compile

# Set-up server
mix ecto.create
mix ecto.migrate

# Start server
mix phx.server
