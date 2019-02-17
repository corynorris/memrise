defmodule MemriseWeb.Resolvers.Subscription do
  alias Memrise.Subscriptions
  alias Memrise.Subscriptions.CourseSubscription
  alias MemriseWeb.Utils.Errors

  def data() do
    Dataloader.Ecto.new(MyApp.Repo, query: &query/2)
  end

  def query(queryable, _params) do
    queryable
  end

  def subscribe_to_course(_parent, course_params, %{context: %{current_user: user}}) do
    subscription_params = Map.put(course_params, :user_id, user.id)

    with {:ok, %CourseSubscription{} = course_subscription} <-
           Subscriptions.subscribe(subscription_params) do
      {:ok, course_subscription}
    else
      {:error, changeset} -> Errors.format(changeset)
    end
  end

  def subscribe_to_course(_, _, _), do: {:error, "Access denied"}

  def unsubscribe_from_course(_parent, %{course_id: course_id}, %{context: %{current_user: user}}) do
    with {:ok, %CourseSubscription{} = course_subscription} <-
           Subscriptions.get_subscription(course_id, user.id),
         {:ok, %CourseSubscription{} = course_subscription} <-
           Subscriptions.unsubscribe(course_subscription) do
      {:ok, course_subscription}
    else
      {:error, errors} -> Errors.format(errors)
    end
  end

  def unsubscribe_from_course(_, _, _), do: {:error, "Access denied"}
end
