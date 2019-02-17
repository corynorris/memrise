defmodule Memrise.Subscriptions.CourseSubscription do
  use Ecto.Schema
  import Ecto.Changeset

  @required_fields ~w(user_id course_id)a

  @primary_key false
  schema "course_subscriptions" do
    belongs_to(:user, Memrise.Accounts.User, primary_key: true)
    belongs_to(:course, Memrise.Courses.Card, primary_key: true)

    timestamps()
  end

  @doc false
  def changeset(course_subscription, attrs) do
    course_subscription
    |> cast(attrs, @required_fields)
    |> validate_required(@required_fields)
    |> foreign_key_constraint(:user_id)
    |> foreign_key_constraint(:course_id)
    |> unique_constraint(:course_id,
      name: :unique_subscriptions,
      message: "Already subscribed to this course."
    )
  end

  def apply_changes(changeset) do
    Ecto.Changeset.apply_changes(changeset)
  end
end
