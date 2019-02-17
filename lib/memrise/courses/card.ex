defmodule Memrise.Courses.Card do
  use Ecto.Schema
  import Ecto.Changeset

  @required_fields ~w(front back course_id)a
  @optional_fields ~w(image hint)a

  schema "cards" do
    field :back, :string
    field :front, :string
    field :hint, :string
    field :image, :string
    field :deleted, :boolean

    belongs_to(:course, Memrise.Courses.Course)

    timestamps()
  end

  def mark_for_deletion(card) do
    change(card, %{deleted: true})
  end

  @doc false
  def changeset(card, attrs) do
    card
    |> cast(attrs, @required_fields ++ @optional_fields)
    |> validate_required(@required_fields)
  end
end
