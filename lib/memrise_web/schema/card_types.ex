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
  end

  object :card_queries do
    @desc "Gets cards owned by the user"
    field :cards, list_of(:card) do
      resolve(&Resolvers.Card.list_cards/3)
    end
  end
end
