defmodule Words do
  @doc """
  Count the number of words in the sentence.

  Words are compared case-insensitively.
  """
  @spec count(String.t) :: map
  def count(sentence) do
    sentence
    |> words
    |> Enum.uniq
    |> Map.new(fn(word) -> {word, Enum.count(words(sentence), fn(el) -> el == word end)} end)
  end

  defp words(sentence) do
    sentence
    |> String.downcase
    |> String.split(~r/[^[:alnum:]\-]/u, trim: true)
  end
end
