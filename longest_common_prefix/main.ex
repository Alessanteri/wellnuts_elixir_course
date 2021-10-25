defmodule Solution do
  @spec longest_common_prefix(strs :: [String.t()]) :: String.t()
  def longest_common_prefix(strs) do
    cond do
      length(strs) == 1 ->
        Enum.at(strs, 0)

      length(strs) == 0 ->
        ""

      String.length(Enum.at(strs, 0)) == 0 ->
        ""

      true ->
        check_longest_prefix(strs, Enum.at(strs, 0))
    end
  end

  defp check_longest_prefix(strs, str) do
    String.replace(
      Enum.reduce(0..(String.length(str) - 1), "", fn x, acc ->
        Enum.reduce_while(1..(length(strs) - 1), 0, fn y, ac ->
          if String.at(str, x) == String.at(Enum.at(strs, y), x) and
               String.at(acc, -1) != "\n",
             do: {:cont, acc <> String.at(str, x)},
             else: {:halt, acc <> "\n"}
        end)
      end),
      "\n",
      ""
    )
  end
end
