defmodule MemriseWeb.Resolvers.Course do
  alias Memrise.Courses
  alias Memrise.Courses.Course
  alias MemriseWeb.Utils.Errors

  # Public
  def list_courses(_parent, _params, _resolvers) do
    {:ok, Courses.list_courses()}
  end

  def get_course(_parent, %{id: course_id}, _resolvers) do
    {:ok, Courses.get_course!(course_id)}
  end

  # Private
  def create_course(_parent, course_params, %{context: %{current_user: user}}) do
    with {:ok, %Course{} = course} <- Courses.create_course(user, course_params) do
      {:ok, course}
    else
      {:error, changeset} -> Errors.format(changeset)
    end
  end

  def create_course(_parent, _params, _resolutions), do: {:error, "Access denied"}

  def list_owned_courses(%Memrise.Accounts.User{} = user, _params, _resolution) do
    {:ok, Courses.list_owned_courses(user)}
  end

  def list_owned_courses(_parent, _params, %{context: %{current_user: user}}) do
    {:ok, Courses.list_owned_courses(user)}
  end

  def list_owned_courses(_parent, _params, _resolutions), do: {:error, "Access denied"}
end
