defmodule MemriseWeb.Schema.CourseTypes do
  use Absinthe.Schema.Notation
  alias MemriseWeb.Resolvers

  # import Absinthe.Resolution.Helpers, only: [dataloader: 1]

  object :course do
    field :id, :id
    field :user_id, :id
    field :name, :string
    field :description, :string

    field :cards, list_of(:card) do
      resolve(&Resolvers.Card.list_cards/3)
    end
  end

  object :course_mutations do
    @desc "Create course"
    field :create_course, type: :course do
      arg(:name, non_null(:string))
      arg(:description, :string)
      resolve(&Resolvers.Course.create_course/3)
    end
  end

  object :course_queries do
    @desc "Gets courses owned by the user"
    field :list_owned_courses, list_of(:course) do
      resolve(&Resolvers.Course.list_owned_courses/3)
    end

    @desc "List all courses"
    field :list_courses, list_of(:course) do
      resolve(&Resolvers.Course.list_courses/3)
    end

    @desc "Get a specific course by ID"
    field :get_course, type: :course do
      arg(:id, non_null(:id))
      resolve(&Resolvers.Course.get_course/3)
    end
  end
end
