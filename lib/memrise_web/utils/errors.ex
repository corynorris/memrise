defmodule MemriseWeb.Utils.Errors do
  defp format_error({key, {value, context}}) do
    details =
      context
      |> Enum.map(fn {a, b} ->
        %{"#{a}": b}
      end)

    key_sentence_case = key |> Atom.to_string() |> Recase.to_sentence()
    key_camel_case = key |> Atom.to_string() |> Recase.to_camel()

    [
      field: key_camel_case,
      message: "#{key_sentence_case} #{value}",
      details: details
    ]
  end

  defp format_error({key, value}) do
    key_sentence_case = key |> Atom.to_string() |> Recase.to_sentence()
    key_camel_case = key |> Atom.to_string() |> Recase.to_camel()

    [
      field: key_camel_case,
      message: "#{key_sentence_case} #{value}"
    ]
  end

  defp format_error(value) do
    value_sentence_case = value |> Atom.to_string() |> Recase.to_sentence()

    [
      message: "#{value_sentence_case}"
    ]
  end

  defp format_changeset(changeset) do
    errors =
      changeset.errors
      |> Enum.map(&format_error/1)

    {:error, errors}
  end

  defp format_array(errors) do
    errors
    |> Enum.map(&format_error/1)

    {:error, errors}
  end

  def format(%Ecto.Changeset{} = errors) do
    format_changeset(errors)
  end

  def format(errors) when is_list(errors) do
    format_array(errors)
  end

  def format(errors) when is_bitstring(errors) do
    {:error, errors}
  end

  def format(_errors) do
    {:error, "Error in request."}
  end
end
