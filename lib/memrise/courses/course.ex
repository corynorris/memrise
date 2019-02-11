defmodule Memrise.Courses.Course do
  use Ecto.Schema
  import Ecto.Changeset

  @required_fields ~w(name)a
  @optional_fields ~w(description user_id)a

  schema "courses" do
    field :description, :string
    field :name, :string

    belongs_to(:user, Memrise.Accounts.User)
    has_many(:cards, Memrise.Courses.Card)

    timestamps()
  end

  @doc false
  def changeset(course, attrs) do
    course
    |> cast(attrs, @required_fields ++ @optional_fields)
    |> validate_required(@required_fields)
  end
end
