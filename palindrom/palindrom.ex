defmodule Solution do
  @spec is_palindrome(x :: integer) :: boolean

  def is_palindrome(x) do

    a = Integer.digits(x)

    if x < 0 do
      false
    else
      if a == Enum.reverse(a) do
        true
      else
        false
      end
    end

  end

end

get_simbol = IO.gets("")
c = String.trim(get_simbol, "\n")

number = String.to_integer(c)

Solution.is_palindrome(number)
