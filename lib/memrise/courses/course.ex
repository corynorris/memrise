defmodule Memrise.Courses.Course do
  use Ecto.Schema
  import Ecto.Changeset
  alias Memrise.Accounts.User
  alias Memrise.Courses.Card

  @required_fields ~w(name description user_id)a
  @optional_fields ~w()a

  schema "courses" do
    field :description, :string
    field :name, :string
    field :deleted, :boolean

    belongs_to(:user, User)
    has_many(:cards, Card)
    many_to_many :subscribers, User, join_through: "course_subscriptions"

    timestamps()
  end

  def mark_for_deletion(card) do
    change(card, %{deleted: true})
  end

  @doc false
  def changeset(course, attrs) do
    course
    |> cast(attrs, @required_fields ++ @optional_fields)
    |> validate_required(@required_fields)
    |> validate_length(:name, min: 1, max: 100)
    |> validate_length(:description, min: 1, max: 2000)
    |> foreign_key_constraint(:user_id)
  end
end
