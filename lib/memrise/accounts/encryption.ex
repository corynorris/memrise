defmodule Memrise.Accounts.Encryption do
  alias Comeonin.Argon2

  @spec password_hashing(binary()) :: any()
  def password_hashing(password), do: Argon2.hashpwsalt(password)

  @spec validate_dummy() :: false
  def validate_dummy(), do: Argon2.dummy_checkpw()

  @spec validate_password(binary(), binary()) :: boolean()
  def validate_password(password, hash), do: Argon2.checkpw(password, hash)

  @spec hash_password(nil | binary()) :: any()
  def hash_password(nil), do: nil
  def hash_password(password), do: Comeonin.Argon2.hashpwsalt(password)
end
