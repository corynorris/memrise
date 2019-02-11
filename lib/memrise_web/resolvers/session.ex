defmodule MemriseWeb.Resolvers.Session do
  alias Memrise.Accounts.Auth

  alias MemriseWeb.Guardian
  alias MemriseWeb.Utils.Errors

  def current_user(_parent, _params, %{context: %{current_user: user}}) do
    {:ok, user}
  end

  def current_user(_parent, _params, _resolution), do: {:error, "Access denied"}

  def sign_in(_parent, user_credentials, _resolution) do
    case Auth.sign_in(user_credentials) do
      {:ok, user} ->
        {:ok, jwt, _full_claims} = user |> Guardian.encode_and_sign()

        {:ok, %{user: user, token: jwt}}

      {:error, :invalid_credentials} ->
        {:error,
         [
           message: "invalid credentials"
         ]}

      {:error, changeset} ->
        Errors.format(changeset)
    end
  end
end
