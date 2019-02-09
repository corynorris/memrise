defmodule MemriseWeb.Resolvers.User do
  alias Memrise.Accounts.User
  alias Memrise.Accounts.Users

  alias MemriseWeb.Guardian
  alias MemriseWeb.Utils.Errors

  def sign_up(_parent, user_params, _resolution) do
    with {:ok, %User{} = user} <- Users.create_user(user_params),
         {:ok, jwt, _full_claims} = Guardian.encode_and_sign(user) do
      {:ok, %{user: user, token: jwt}}
    else
      {:error, changeset} -> Errors.format(changeset)
    end
  end

  @spec current_user(any(), any(), any()) :: nil
  def current_user(_parent, _params, _resolution) do
  end
end
