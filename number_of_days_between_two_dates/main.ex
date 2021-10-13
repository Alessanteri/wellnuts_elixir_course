defmodule Solution do
  @spec days_between_dates(date1 :: String.t(), date2 :: String.t()) :: integer
  def days_between_dates(date1, date2) do
    Solution.sing(Date.diff(Date.from_iso8601!(date1), Date.from_iso8601!(date2)))
  end

  def sing(result) when result < 0, do: result * -1
  def sing(result) when result >= 0, do: result
end

date1 = "2019-06-29"
date2 = "2019-06-30"

IO.puts(Solution.days_between_dates(date1, date2))
