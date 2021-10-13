defmodule Solution do
  @spec longest_common_prefix(strs :: [String.t()]) :: String.t()
  def longest_common_prefix(strs) do
    if length(strs) < 2 do
      if length(strs) == 1 do
        Enum.at(strs, 0)
      else
        ""
      end
    else
      if String.length(Enum.at(strs, 0)) == 0 do
        ""
      else
        str = Enum.at(strs, 0)

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
  end
end

strs = ["acb", "b", "", ""]
a = Solution.longest_common_prefix(strs)
IO.puts(a)
