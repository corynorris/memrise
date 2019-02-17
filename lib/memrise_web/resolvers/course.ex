defmodule MemriseWeb.Resolvers.Course do
  alias Memrise.Courses
  alias Memrise.Courses.Course
  alias MemriseWeb.Utils.Errors

  def data() do
    Dataloader.Ecto.new(MyApp.Repo, query: &query/2)
  end

  def query(queryable, _params) do
    queryable
  end

  # Public
  def list_courses(_parent, _params, _resolvers) do
    {:ok, Courses.list_courses()}
  end

  def get_course(_parent, %{id: course_id}, _resolvers) do
    {:ok, Courses.get_course!(course_id)}
  end

  # Private
  def create_course(_parent, course_params, %{context: %{current_user: user}}) do
    authorized_params = Map.put(course_params, :user_id, user.id)

    with {:ok, %Course{} = course} <- Courses.create_course(authorized_params) do
      {:ok, course}
    else
      {:error, error} -> Errors.format(error)
    end
  end

  def create_course(_, _, _), do: {:error, "Access denied"}

  def update_course(_parent, course_params, %{context: %{current_user: user}}) do
    with {:ok, %Course{} = course} <- Courses.get_user_course(user, course_params.id),
         {:ok, %Course{} = course} <- Courses.update_course(course, course_params) do
      {:ok, course}
    else
      {:error, error} ->
        Errors.format(error)
    end
  end

  def update_course(_, _, _), do: {:error, "Access denied"}

  def delete_course(_parent, course_params, %{context: %{current_user: user}}) do
    IO.inspect(course_params)

    with {:ok, %Course{} = course} <- Courses.get_user_course(user, course_params.id),
         {:ok, %Course{} = course} <- Courses.delete_course(course) do
      {:ok, course}
    else
      {:error, error} ->
        Errors.format(error)
    end
  end

  def delete_course(_, _, _), do: {:error, "Access denied"}

  @spec subscribe_to_course(any(), any(), any()) ::
          {:error, bitstring() | maybe_improper_list()} | {:ok, Memrise.Courses.Course.t()}
  def subscribe_to_course(_parent, course_params, %{context: %{current_user: user}}) do
    with {:ok, %Course{} = course} <- Courses.subscribe_to_course(user, course_params) do
      {:ok, course}
    else
      {:error, changeset} -> Errors.format(changeset)
    end
  end

  # def subscribe_to_course(_parent, _params, _resolutions),
  #   do: {:error, "You need to be logged in to subscribe to a course"}
end
