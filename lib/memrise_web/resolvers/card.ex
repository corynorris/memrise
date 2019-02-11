defmodule MemriseWeb.Resolvers.Card do
  alias Memrise.Courses
  alias Memrise.Courses.Card
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
    with {:ok, %Card{} = card} <- Courses.create_card(user, card_params) do
      {:ok, card}
    else
      {:error, changeset} -> Errors.format(changeset)
    end
  end

  def create_card(_parent, _params, _resolutions), do: {:error, "Access denied"}
end
