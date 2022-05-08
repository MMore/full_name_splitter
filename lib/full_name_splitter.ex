defmodule FullNameSplitter do
  @moduledoc """
  Splits a full name properly in most of the cases.
  """

  @doc """
  Returns a tuple with first element being `first_name` and the second the `last_name`.
  """
  def split(""), do: {nil, nil}
  def split(nil), do: {nil, nil}

  def split(full_name) do
    {:ok, tokens, _} = full_name |> to_charlist() |> :full_name_lexer.string()

    {first_name, last_name} =
      try do
        {:ok, result} = :full_name_parser.parse(tokens)
        result
      rescue
        _ ->
          [last_name | rest] = full_name |> String.split(" ", trim: true) |> Enum.reverse()
          other_names = rest |> Enum.reverse() |> Enum.join(" ")
          {other_names, last_name}
      end

    {convert_invalid_binary(first_name), convert_invalid_binary(last_name)}
  end

  defp convert_invalid_binary(nil), do: nil

  defp convert_invalid_binary(binary) do
    :iconv.convert("iso8859-15", "utf-8", binary)
  end
end
