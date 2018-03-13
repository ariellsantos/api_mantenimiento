# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :api_mantenimiento,
  ecto_repos: [ApiMantenimiento.Repo]

# Configures the endpoint
config :api_mantenimiento, ApiMantenimientoWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "9iqp+xAvzMl4bmClOBjiYsy4SA2YnJT2g9kdPa+kQxjTAw3/RVHQFEyAHO6/fc7B",
  render_errors: [view: ApiMantenimientoWeb.ErrorView, accepts: ~w(json)],
  pubsub: [name: ApiMantenimiento.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"

config :api_mantenimiento, ApiMantenimientoWeb.Auth.Guardian,
       issuer: "api_mantenimiento",
       secret_key: "vF0d9p1tNne7ZMIWCc7ZglSrIxjnylA1LtXCqtJaWhQXMX8fHAS3rbLWexuEArPA"