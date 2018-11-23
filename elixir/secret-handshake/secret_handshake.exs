defmodule SecretHandshake do
  @doc """
  Determine the actions of a secret handshake based on the binary
  representation of the given `code`.

  If the following bits are set, include the corresponding action in your list
  of commands, in order from lowest to highest.

  1 = wink
  10 = double blink
  100 = close your eyes
  1000 = jump

  10000 = Reverse the order of the operations in the secret handshake
  """

  @codes ["jump", "close your eyes", "double blink", "wink"]

  @spec commands(code :: integer) :: list(String.t())
  def commands(code) do
    handshake(code)
  end

  defp handshake(number) when is_number(number) do
    handshake(<<number::5>>)
  end

  defp handshake(<<reverse::1, jump::1, close::1, double::1, wink::1>>) do
    shake =
      [jump, close, double, wink]
      |> Enum.zip(@codes)
      |> Enum.reduce([], fn
        {0, _}, acc -> acc
        {1, code}, acc -> [code | acc]
      end)

    if reverse == 1, do: Enum.reverse(shake), else: shake
  end
end
