defmodule Solution do
  @spec is_valid(s :: String.t) :: boolean
  def is_valid(s) do

    b = String.codepoints(s)

    |> Enum.reduce([], &(check_sumbol(&1, &2)))
    |> Kernel.==([])
  end
  defp check_sumbol(elem, stack) do
    #IO.puts("elem#{elem}")
    case elem do
      "[" -> push(stack, "[")
      "{" -> push(stack, "{")
      "(" -> push(stack, "(")
      "]" -> pop(stack, "[")
      "}" -> pop(stack, "{")
      ")" -> pop(stack, "(")
    end
  end

  defp push(stack, elem) do
    [elem | stack]
  end

  defp pop([head | tail] = _stack, elem) when head == elem do
    #IO.puts("H#{head}")
    tail
  end
  defp pop(stack, elem) do
    ["error" | stack]
  end

    # if k == Enum.reverse(b) do
    #   true
    # else
    #   false
    # end

    # # = []
    # #List.insert_at(ls, 0, s)
    # #Enum.each(ls, fn(x) -> IO.puts(x) end)
    # Enum.reduce(0..length(b) - 1, 0, fn(x, acc]) ->

    #   k = brackets[String.to_atom(Enum.at(b, x))]
    #   IO.puts("KK #{k}")
    #   IO.puts("#{x}")
    #   IO.puts("#{acc}")
    #   #num.at(ls, 0)
    #   x = 0
    #   acc + 1
    # end)

    #recursion
    # l = String.length(s)
    # s = String.replace(s, "()", "")
    # s = String.replace(s, "[]", "")
    # s = String.replace(s, "{}", "")
    # #IO.puts("#{s}")
    # l_new = String.length(s)
    # if l_new == 0 do
    #   IO.puts("true")
    #   true
    # else
    #   if l == l_new || rem(l_new, 2) != 0 do
    #     IO.puts("false")
    #     false
    #   else
    #     if l_new > 0 && l != l_new && l_new != 0 do
    #       IO.puts("A #{s}")
    #       Solution.is_valid(s)
    #     end
    #     if l_new == 0 do
    #       IO.puts("true")
    #       true
    #     end
    #   end
    # end
end


get_number = IO.gets("")

s = String.trim(get_number, "\n")


k = Solution.is_valid(s)

IO.puts("#{k}")
