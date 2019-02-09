# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :memrise,
  ecto_repos: [Memrise.Repo]

# Configures the endpoint
config :memrise, MemriseWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "ipptE0k9iyvmE6NM5olW1w8+Pt/QQl9I9nFCP5r3geZWvISigZxkGWSyc6UUra77",
  render_errors: [view: MemriseWeb.ErrorView, accepts: ~w(json)],
  pubsub: [name: Memrise.PubSub, adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Guardian
config :memrise, MemriseWeb.Guardian,
  issuer: "memrise",
  secret_key: "secret"

# Hash settings for Argon2
config :argon2_elixir, t_cost: 2, m_cost: 8

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
