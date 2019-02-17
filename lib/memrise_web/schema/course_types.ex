defmodule MemriseWeb.Schema.CourseTypes do
  use Absinthe.Schema.Notation
  alias MemriseWeb.Resolvers

  import Absinthe.Resolution.Helpers, only: [dataloader: 1]

  object :course do
    field :id, :id
    field :user_id, :id
    field :name, :string
    field :description, :string

    field :cards, list_of(:card), resolve: dataloader(:courses)
  end

  object :course_queries do
    @desc "List all courses"
    field :courses, list_of(:course) do
      resolve(&Resolvers.Course.list_courses/3)
    end

    @desc "Get a specific course by ID"
    field :course, type: :course do
      arg(:id, non_null(:id))
      resolve(&Resolvers.Course.get_course/3)
    end
  end

  object :course_mutations do
    @desc "Create a course"
    field :create_course, type: :course do
      arg(:name, non_null(:string))
      arg(:description, :string)
      resolve(&Resolvers.Course.create_course/3)
    end

    @desc "Update a course"
    field :update_course, type: :course do
      arg(:id, non_null(:id))
      arg(:name, :string)
      arg(:description, :string)
      resolve(&Resolvers.Course.update_course/3)
    end

    @desc "Delete a course"
    field :delete_course, type: :course do
      arg(:id, non_null(:id))
      resolve(&Resolvers.Course.delete_course/3)
    end
  end
end
