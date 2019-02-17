defmodule Memrise.Courses.CourseSubscription do
  use Ecto.Schema
  import Ecto.Changeset

  @required_fields ~w(user_id course_id)a

  schema "course_subscriptions" do
    belongs_to(:user, Memrise.Accounts.User)
    belongs_to(:course, Memrise.Courses.Card)

    timestamps()
  end

  @doc false
  def changeset(course_subscription, attrs) do
    course_subscription
    |> cast(attrs, @required_fields)
    |> validate_required(@required_fields)
  end
end
