defmodule MemriseWeb.Schema.UserTypes do
  use Absinthe.Schema.Notation

  alias MemriseWeb.Resolvers

  import Absinthe.Resolution.Helpers, only: [dataloader: 1]

  object :user do
    field :id, :id
    field :email, :string
    field :first_name, :string
    field :last_name, :string

    field :owned_courses, list_of(:course), resolve: dataloader(:courses)
    field :subscribed_courses, list_of(:course), resolve: dataloader(:courses)
  end

  object :current_user do
    field :token, :string
    field :user, :user
  end

  object :user_queries do
    @desc "Sign in a user"
    field :sign_in, type: :current_user do
      arg(:email, non_null(:string))
      arg(:password, non_null(:string))
      resolve(&Resolvers.Session.sign_in/3)
    end

    @desc "Gets the details of the current logged in user"
    field :current_user, type: :user do
      resolve(&Resolvers.Session.current_user/3)
    end
  end

  object :user_mutations do
    @desc "Sign up a new user"
    field :sign_up, type: :current_user do
      arg(:email, non_null(:string))
      arg(:first_name, non_null(:string))
      arg(:last_name, non_null(:string))
      arg(:password, non_null(:string))
      arg(:password_confirmation, non_null(:string))
      resolve(&Resolvers.User.sign_up/3)
    end
  end
end
