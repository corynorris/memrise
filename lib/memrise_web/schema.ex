defmodule MemriseWeb.Schema do
  use Absinthe.Schema
  import_types(MemriseWeb.Schema.UserTypes)

  alias MemriseWeb.Resolvers

  mutation do
    @desc "Register a new user"
    field :register, type: :current_user do
      arg(:email, non_null(:string))
      arg(:first_name, non_null(:string))
      arg(:last_name, non_null(:string))
      arg(:password, non_null(:string))
      arg(:password_confirmation, non_null(:string))
      resolve(&Resolvers.User.sign_up/3)
    end
  end

  query do
    @desc "Sign in a user"
    field :sign_in, type: :current_user do
      arg(:email, non_null(:string))
      arg(:password, non_null(:string))
      resolve(&Resolvers.Session.sign_in/3)
    end
  end
end
