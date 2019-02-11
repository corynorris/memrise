defmodule Memrise.Accounts.Users do
  @moduledoc """
  The Accounts context.
  """
  alias Memrise.Repo
  alias Memrise.Accounts.User

  import Ecto.Query, warn: false

  def get_user!(id), do: Repo.get!(User, id)

  def create_user(attrs \\ %{}) do
    %User{}
    |> User.changeset(attrs)
    |> Repo.insert()
  end
end
