defmodule Memrise.Repo do
  use Ecto.Repo,
    otp_app: :memrise,
    adapter: Ecto.Adapters.Postgres
end
