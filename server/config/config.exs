# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :prepply,
  ecto_repos: [Prepply.Repo]

config :prepply, Prepply.Mailer,
  adapter: Bamboo.SendGridAdapter,
  api_key: "c6cdea386dc70ce2e4996c89f6dc8aa1-c50a0e68-da9850da",
  domain: "sandboxf25257ed2463441da5734375e5543dd4.mailgun.org",
  hackney_opts: [
    recv_timeout: :timer.minutes(1)
  ]

config :ex_aws,
  json_codec: Jason,
  access_key_id: System.get_env("AWS_ACCESS_KEY_ID"),
  secret_access_key: System.get_env("AWS_SECRET_ACCESS_KEY"),
  s3: [
    scheme: "https://",
    region: "ap-southeast-1",
    host: "s3-ap-southeast-1.amazonaws.com"
  ]

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
