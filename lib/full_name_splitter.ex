defmodule FullNameSplitter do
  @moduledoc """
  Splits a full name properly in most of the cases.
  """

  @doc """
  Returns a tuple with first element beeing `first_name` and the second the `last_name`.
  """
  def split(""), do: {nil, nil}
  def split(nil), do: {nil, nil}

  def split(full_name) do
    {:ok, tokens, _} = full_name |> to_charlist() |> :full_name_lexer.string()
    {:ok, result} = :full_name_parser.parse(tokens)
    result
  end
end
