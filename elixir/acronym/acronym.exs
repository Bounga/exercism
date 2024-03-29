defmodule Acronym do
  @doc """
  Generate an acronym from a string.
  "This is a string" => "TIAS"
  """
  @spec abbreviate(String.t()) :: String.t()
  def abbreviate(string) do
    ~r/\b\w|(?<=\p{Ll})\p{Lu}/
    |> Regex.scan(string)
    |> Enum.join
    |> String.upcase
  end
end
