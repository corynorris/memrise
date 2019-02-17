defmodule Memrise.Courses.CourseActivity do
  use Ecto.Schema
  import Ecto.Changeset


  schema "course_activity" do
    field :last_studied, :naive_datetime
    field :retries, :integer
    field :strength, :integer
    field :card_id, :id
    field :user_id, :id

    timestamps()
  end

  @doc false
  def changeset(course_activity, attrs) do
    course_activity
    |> cast(attrs, [:strength, :retries, :last_studied])
    |> validate_required([:strength, :retries, :last_studied])
  end
end
