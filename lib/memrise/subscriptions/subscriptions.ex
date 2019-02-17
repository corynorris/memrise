defmodule Memrise.Subscriptions do
  @moduledoc """
  The Subscriptions context.
  """
  import Ecto.Query, warn: false
  alias Memrise.Repo

  alias Memrise.Subscriptions.CourseSubscription

  def get_subscription(course_id, user_id) do
    query =
      from cs in CourseSubscription,
        where: cs.course_id == ^course_id and cs.user_id == ^user_id

    query
    |> Repo.one()
    |> case do
      nil -> {:error, "Subscription doesn't exist"}
      course_subscription -> {:ok, course_subscription}
    end
  end

  def subscribe(attrs \\ %{}) do
    %CourseSubscription{}
    |> CourseSubscription.changeset(attrs)
    |> Repo.insert()
  end

  def unsubscribe(%CourseSubscription{} = course_subscription) do
    course_subscription
    |> Repo.delete()
  end
end
