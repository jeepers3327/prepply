# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :prepply,
  ecto_repos: [Prepply.Repo]

# Configures the endpoint
config :prepply, PrepplyWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "I19Q5pe6+lJkApcMmhce4LEd1+U5RZpnn+5fcWE+2T5m2kCoPABlqUKhg/sdM7uk",
  render_errors: [view: PrepplyWeb.ErrorView, accepts: ~w(json), layout: false],
  pubsub_server: Prepply.PubSub,
  live_view: [signing_salt: "E7UEFhy2"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
