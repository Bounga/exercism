defmodule RotationalCipher do
  @doc """
  Given a plaintext and amount to shift by, return a rotated string.

  Example:
  iex> RotationalCipher.rotate("Attack at dawn", 13)
  "Nggnpx ng qnja"
  """

  @lower ?a..?z
  @upper ?A..?Z
  
  @spec rotate(text :: String.t(), shift :: integer) :: String.t()
  def rotate(text, shift) do
    translate(text, shift)
  end

  defp translate(text, 0) do
    text
  end

  defp translate(text, 26) do
    text
  end

  defp translate(text, shift) do
    text
    |> to_charlist
    |> Enum.map(fn
      char when char in @lower ->
        if char + shift > ?z, do: char + shift - 26, else: char + shift
      char when char in @upper ->
        if char + shift > ?Z, do: char + shift - 26, else: char + shift
      other -> other
    end)
    |> to_string
  end
end
