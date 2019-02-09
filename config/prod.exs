use Mix.Config

config :memrise, MemriseWeb.Endpoint,
  http: [:inet6, port: System.get_env("PORT")],
  url: [scheme: "https", host: "memrise.corynorris.me", port: 443],
  force_ssl: [rewrite_on: [:x_forwarded_proto]],
  cache_static_manifest: "priv/static/cache_manifest.json",
  secret_key_base: Map.fetch!(System.get_env(), "SECRET_KEY_BASE")

# Do not print debug messages in production
config :logger, level: :info

config :memrise, Memrise.Repo,
  url: System.get_env("DATABASE_URL"),
  pool_size: String.to_integer(System.get_env("POOL_SIZE") || "10"),
  ssl: true

config :memrise, TrelloWeb.Guardian,
  issuer: "memrise",
  secret_key: Map.fetch!(System.get_env(), "SECRET_KEY")

config :memrise, MemriseWeb.Guardian,
  issuer: "memrise",
  secret_key: Map.fetch!(System.get_env(), "SECRET_KEY")
