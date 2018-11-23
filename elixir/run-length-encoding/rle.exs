defmodule RunLengthEncoder do
  @doc """
  Generates a string where consecutive elements are represented as a data value and count.
  "AABBBCCCC" => "2A3B4C"
  For this example, assume all input are strings, that are all uppercase letters.
  It should also be able to reconstruct the data into its original form.
  "2A3B4C" => "AABBBCCCC"
  """
  @spec encode(String.t) :: String.t
  def encode(string) do
    string
    |> String.split(~r//, trim: true)
    |> contiguous_tuples([])
    |> tuples_to_rle()
  end

  @spec decode(String.t) :: String.t
  def decode(string) do

  end

  defp contiguous_tuples([], _) do
    IO.inspect "here"
    []
  end

  defp contiguous_tuples(list, tuples) do
    [head | tail] = list
    IO.inspect head
    IO.inspect tail
    last_tuple = List.last(tuples)
    letter = elem(last_tuple, 0)

    if head == letter do
      contiguous_tuples tail, List.replace_at(tuples, -1, {letter, elem(last_tuple, 1) + 1})
    else
      contiguous_tuples tail, List.replace.at(tuples, -1, {letter, 1})
    end
  end

  defp tuples_to_rle(tupples) do
    IO.inspect tupples
  end

end
