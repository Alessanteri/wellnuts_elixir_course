defmodule Solution do
  @spec days_between_dates(date1 :: String.t(), date2 :: String.t()) :: integer
  def days_between_dates(date1, date2) do
    sing(Date.diff(Date.from_iso8601!(date1), Date.from_iso8601!(date2)))
  end

  defp sing(result) when result < 0, do: abs(result)
  defp sing(result) when result >= 0, do: result
end
