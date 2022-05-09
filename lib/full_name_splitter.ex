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
    {first_name, last_name} =
      try do
        {:ok, tokens, _} =
          full_name |> String.normalize(:nfd) |> to_charlist() |> :full_name_lexer.string()

        {:ok, result} = :full_name_parser.parse(tokens)
        result
      rescue
        _ ->
          [last_name | rest] = full_name |> String.split(" ", trim: true) |> Enum.reverse()
          other_names = rest |> Enum.reverse() |> Enum.join(" ")
          {other_names, last_name}
      end

    {first_name, last_name}
  end
end
