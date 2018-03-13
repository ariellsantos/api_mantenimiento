use Mix.Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :api_mantenimiento, ApiMantenimientoWeb.Endpoint,
  http: [port: 4001],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

# Configure your database
config :api_mantenimiento, ApiMantenimiento.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "postgres",
  password: "camoranesi16",
  database: "api_mantenimiento_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox

config :pbkdf2_elixir, rounds: 1