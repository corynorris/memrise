defmodule MemriseWeb.Schema.CardTypes do
  use Absinthe.Schema.Notation
  alias MemriseWeb.Resolvers

  object :card do
    field :id, :id
    field :back, :string
    field :front, :string
    field :hint, :string
    field :image, :string
  end

  object :card_queries do
  end

  object :card_mutations do
    @desc "Create card"
    field :create_card, type: :card do
      arg(:back, non_null(:string))
      arg(:front, non_null(:string))
      arg(:course_id, non_null(:id))
      arg(:hint, :string)
      arg(:image, :string)
      resolve(&Resolvers.Card.create_card/3)
    end

    @desc "Update card"
    field :update_card, type: :card do
      arg(:id, non_null(:id))
      arg(:back, non_null(:string))
      arg(:front, non_null(:string))
      arg(:course_id, non_null(:id))
      arg(:hint, :string)
      arg(:image, :string)
      resolve(&Resolvers.Card.update_card/3)
    end

    @desc "Delete card"
    field :delete_card, type: :card do
      arg(:id, non_null(:id))
      resolve(&Resolvers.Card.delete_card/3)
    end
  end
end
