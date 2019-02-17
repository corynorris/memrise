defmodule Memrise.Courses.Card do
  use Ecto.Schema
  import Ecto.Changeset

  @required_fields ~w(front back course_id)a
  @optional_fields ~w(image hint)a

  schema "cards" do
    field :back, :string
    field :front, :string
    field :hint, :string
    field :image, :string
    field :deleted, :boolean

    belongs_to(:course, Memrise.Courses.Course)

    timestamps()
  end

  def mark_for_deletion(card) do
    change(card, %{deleted: true})
  end

  @doc false
  def changeset(card, attrs) do
    card
    |> cast(attrs, @required_fields ++ @optional_fields)
    |> validate_required(@required_fields)
    |> foreign_key_constraint(:course_id)
    |> validate_length(:front, min: 1, max: 100)
    |> validate_length(:back, min: 1, max: 100)
    |> validate_length(:hint, min: 1, max: 2000)
    |> validate_url(:image)
  end

  defp validate_url(changeset, field, opts \\ []) do
    validate_change(changeset, field, fn _, value ->
      case URI.parse(value) do
        %URI{scheme: nil} ->
          "is missing a scheme (e.g. https)"

        %URI{host: nil} ->
          "is missing a host"

        %URI{host: host} ->
          case :inet.gethostbyname(Kernel.to_charlist(host)) do
            {:ok, _} -> nil
            {:error, _} -> "invalid host"
          end
      end
      |> case do
        error when is_binary(error) -> [{field, Keyword.get(opts, :message, error)}]
        _ -> []
      end
    end)
  end
end
