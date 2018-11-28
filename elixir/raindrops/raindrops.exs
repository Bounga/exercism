defmodule Raindrops do
  @factors %{
    3 => "Pling",
    5 => "Plang",
    7 => "Plong"
  }

  @doc """
  Returns a string based on raindrop factors.

  - If the number contains 3 as a prime factor, output 'Pling'.
  - If the number contains 5 as a prime factor, output 'Plang'.
  - If the number contains 7 as a prime factor, output 'Plong'.
  - If the number does not contain 3, 5, or 7 as a prime factor,
    just pass the number's digits straight through.
  """
  @spec convert(pos_integer) :: String.t
  def convert(number) do
    string = number_to_string(number)

    if string == "", do: to_string(number), else: string
  end

  defp number_to_string(number) do
    Enum.map(@factors, fn({k, v}) ->
      if Integer.mod(number, k) == 0, do: v
    end)
    |> Enum.join
  end
end
