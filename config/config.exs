# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
import Config

config :drift_delivery,
  ecto_repos: [DriftDelivery.Repo]

# Configures the endpoint
config :drift_delivery, DriftDeliveryWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "ylYDG2wwARhBq1BIkDyICK/4+f3HVanDgppSIoeKwEDcCl8+Yqmvd6ijE+x1MUz4",
  render_errors: [view: DriftDeliveryWeb.ErrorView, accepts: ~w(json), layout: false],
  pubsub_server: DriftDelivery.PubSub,
  live_view: [signing_salt: "TKU/Nxfu"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
