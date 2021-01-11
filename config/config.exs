# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :gearbox,
  ecto_repos: [Gearbox.Repo]

# Configures the endpoint
config :gearbox, GearboxWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "3ElIrVpzIi6fxyww/zl0a0NYBFVIGvefYzk+zAbsWIp4YkzKsq8Av1Vq1MUcEV+f",
  render_errors: [view: GearboxWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: Gearbox.PubSub,
  live_view: [signing_salt: "eaN1j25l"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
