defmodule Solution do
  @spec roman_to_int(s :: String.t) :: integer
  def roman_to_int(s) do

    roman_number = ["I": 1, "V": 5, "X": 10, "L": 50, "C": 100, "D": 500, "M": 1000]

    b = String.codepoints(s)
    if length(b) == 0 do
      0
    else
      if length(b) == 1 do
        roman_number[String.to_atom(Enum.at(b, 0))]
      else
        go_ls = Enum.reverse(Enum.map(b, fn(x) -> roman_number[String.to_atom(x)] end))

        fin = Enum.reduce(1..length(go_ls) - 1, Enum.at(go_ls, 0), fn(x, acc) ->

          if Enum.at(go_ls, x - 1) > Enum.at(go_ls, x) do
            acc - Enum.at(go_ls, x)
          else
            acc + Enum.at(go_ls, x)
          end

        end)
      end

    end
  end

end


get_number = IO.gets("")

b = String.trim(get_number, "\n")


Solution.roman_to_int(b)
