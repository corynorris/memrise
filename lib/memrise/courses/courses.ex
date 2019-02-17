defmodule Memrise.Courses do
  @moduledoc """
  The Courses context.
  """

  import Ecto.Query, warn: false
  alias Memrise.Repo

  alias Memrise.Courses.Course

  @doc """
    Data Loader
  """
  def data() do
    Dataloader.Ecto.new(Memrise.Repo, query: &query/2)
  end

  def query(queryable, _params) do
    queryable
    |> with_active()
  end

  def with_active(query) do
    from w in query,
      where: w.deleted == false
  end

  @doc """
  Returns the list of courses.

  ## Examples

      iex> list_courses()
      [%Course{}, ...]

  """
  def list_courses do
    Course
    |> with_active()
    |> Repo.all()
  end

  @doc """
  Gets a single course.

  Raises `Ecto.NoResultsError` if the Course does not exist.

  ## Examples

      iex> get_course!(123)
      %Course{}

      iex> get_course!(456)
      ** (Ecto.NoResultsError)

  """
  def get_course!(id), do: Course |> with_active() |> Repo.get!(id)

  def get_user_course(user, course_id) do
    user
    |> Ecto.assoc(:owned_courses)
    |> with_active()
    |> Repo.get(course_id)
    |> case do
      nil -> {:error, "Course doesn't exist, or this user doesn't have access to it."}
      course -> {:ok, course}
    end
  end

  @doc """
  Creates a course.

  ## Examples

      iex> create_course(%{field: value})
      {:ok, %Course{}}

      iex> create_course(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_course(attrs \\ %{}) do
    %Course{}
    |> Course.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a course.

  ## Examples

      iex> update_course(course, %{field: new_value})
      {:ok, %Course{}}

      iex> update_course(course, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """

  def update_course(%Course{} = course, attrs) do
    course
    |> Course.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Course.

  ## Examples

      iex> delete_course(course)
      {:ok, %Course{}}

      iex> delete_course(course)
      {:error, %Ecto.Changeset{}}

  """
  def delete_course(%Course{} = course) do
    # from(c in "cards", where: c.course_id == ^course.id)
    Ecto.Multi.new()
    |> Ecto.Multi.update(:courses, Course.mark_for_deletion(course))
    |> Ecto.Multi.update_all(:update_all, Ecto.assoc(course, :cards), set: [deleted: true])
    |> Repo.transaction()
    |> case do
      {:ok, _} -> {:ok, course}
      _ -> {:error, "Operation failed"}
    end
  end

  # @doc """
  # Deletes a Course.

  # ## Examples

  #     iex> archive_course(course)
  #     {:ok, %Course{}}

  #     iex> archive_course(course)
  #     {:error, %Ecto.Changeset{}}

  # """
  # def archive_course(%Course{} = course) do
  #   Repo.delete(course)
  # end

  alias Memrise.Courses.Card

  @doc """
  Returns the list of card.

  ## Examples

      iex> list_cards()
      [%Card{}, ...]

  """
  def list_cards do
    Repo.all(Card)
  end

  def list_cards(course) do
    course
    |> Ecto.assoc(:cards)
    |> with_active()
    |> Repo.all()
  end

  @doc """
  Gets a single card.

  Raises `Ecto.NoResultsError` if the Card does not exist.

  ## Examples

      iex> get_card!(123)
      %Card{}

      iex> get_card!(456)
      ** (Ecto.NoResultsError)

  """
  def get_card!(id), do: Repo.get!(Card, id)

  def get_user_card(user, card_id) do
    user
    |> Ecto.assoc(:owned_cards)
    |> with_active()
    |> Repo.get(card_id)
    |> case do
      nil -> {:error, "Card doesn't exist, or this user doesn't have access to it."}
      course -> {:ok, course}
    end
  end

  @doc """
  Creates a card.

  ## Examples

      iex> create_card(%{field: value})
      {:ok, %Card{}}

      iex> create_card(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_card(attrs \\ %{}) do
    %Card{}
    |> Card.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a card.

  ## Examples

      iex> update_card(card, %{field: new_value})
      {:ok, %Card{}}

      iex> update_card(card, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_card(%Card{} = card, attrs) do
    card
    |> Card.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Card.

  ## Examples

      iex> delete_card(card)
      {:ok, %Card{}}

      iex> delete_card(card)
      {:error, %Ecto.Changeset{}}

  """
  def delete_card(%Card{} = card) do
    card
    |> Card.mark_for_deletion()
    |> Repo.update()
  end
end
