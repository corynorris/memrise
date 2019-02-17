defmodule MemriseWeb.Resolvers.Card do
  alias Memrise.Courses
  alias Memrise.Courses.Card
  alias Memrise.Courses.Course
  alias MemriseWeb.Utils.Errors

  # Public
  def list_cards(%Memrise.Courses.Course{} = course, _params, _resolution) do
    {:ok, Courses.list_cards(course)}
  end

  def get_card(_parent, %{id: card_id}, _resolvers) do
    {:ok, Courses.get_card!(card_id)}
  end

  # Private
  def create_card(_parent, card_params, %{context: %{current_user: user}}) do
    with {:ok, %Course{} = _course} <- Courses.get_user_course(user, card_params.course_id),
         {:ok, %Card{} = card} <- Courses.create_card(card_params) do
      {:ok, card}
    else
      {:error, errors} -> Errors.format(errors)
    end
  end

  def create_card(_, _, _), do: {:error, "Access denied"}

  def update_card(_parent, card_params, %{context: %{current_user: user}}) do
    with {:ok, %Card{} = card} <- Courses.get_user_card(user, card_params.course_id),
         {:ok, %Card{} = card} <- Courses.update_card(card, card_params) do
      {:ok, card}
    else
      {:error, errors} -> Errors.format(errors)
    end
  end

  def update_card(_, _, _), do: {:error, "Access denied"}
end
