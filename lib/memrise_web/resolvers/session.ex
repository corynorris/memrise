defmodule MemriseWeb.Resolvers.Session do
  alias Memrise.Accounts.Auth

  alias MemriseWeb.Guardian
  alias MemriseWeb.Utils.Errors

  # def sign_in(_parent, user_params, _resolution) do
  #   with {:ok, %User{} = user} <- Users.create_user(user_params),
  #        {:ok, jwt, _full_claims} = Guardian.encode_and_sign(user) do
  #     {:ok, %{user: user, token: jwt}}
  #   else
  #     {:error, changeset} -> Errors.format(changeset)
  #   end
  # end

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
