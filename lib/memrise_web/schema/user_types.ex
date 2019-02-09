defmodule MemriseWeb.Schema.UserTypes do
  use Absinthe.Schema.Notation

  object :user do
    field :email, :string
    field :first_name, :string
    field :last_name, :string
  end

  object :current_user do
    field :token, :string
    field :user, :user
  end
end
