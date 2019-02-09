defmodule Memrise.Accounts.Auth do
  alias Memrise.Repo
  alias Memrise.Accounts.{User, Encryption}
  import Ecto.Query, warn: false

  def sign_in(credentials \\ %{}) do
    %User{}
    |> User.sign_in_changeset(credentials)
    |> authenticate()
  end

  defp authenticate(%Ecto.Changeset{valid?: false} = changeset) do
    {:error, changeset}
  end

  defp authenticate(%Ecto.Changeset{valid?: true, changes: %{email: email, password: password}}) do
    query = from(u in User, where: u.email == ^email)

    case Repo.one(query) do
      nil ->
        Encryption.validate_dummy()
        {:error, :invalid_credentials}

      user ->
        if Encryption.validate_password(password, user.password) do
          {:ok, user}
        else
          {:error, :invalid_credentials}
        end
    end
  end
end
