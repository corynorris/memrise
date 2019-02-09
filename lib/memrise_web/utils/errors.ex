defmodule MemriseWeb.Utils.Errors do
  defp format_changeset(changeset) do
    errors =
      changeset.errors
      |> Enum.map(fn {key, {value, context}} ->
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
      end)

    {:error, errors}
  end

  def format(changeset) do
    format_changeset(changeset)
  end
end
