defmodule Solution do
  @spec update_board(board :: [[char]], click :: [integer]) :: [[char]]
  def update_board(board, click) do
    Solution.dfs(
      board,
      Enum.at(click, 0),
      Enum.at(click, 1),
      Enum.at(Enum.at(board, Enum.at(click, 0)), Enum.at(click, 1))
    )
  end

  def dfs(board, i, j, a) when a == "M" do
    List.replace_at(board, i, List.replace_at(Enum.at(board, i), j, "X"))
  end

  def dfs(board, i, j, a) when a == "E" do
    if Solution.find_sum_mins(board, i, j) != 0 do
      Solution.replace_sumbol(
        board,
        i,
        j,
        Enum.at(Enum.at(board, i), j),
        Solution.find_sum_mins(board, i, j)
      )
    else
      row_cow =
        [{0, 0}, {0, -1}, {0, 1}, {-1, 0}, {1, 0}, {-1, -1}, {-1, 1}, {1, -1}, {1, 1}]
        |> Stream.filter(fn {row, cow} ->
          i + row >= 0 and i + row < length(board) and j + cow >= 0 and
            j + cow < length(Enum.at(board, i + row))
        end)
        |> Enum.reduce(board, fn {row, cow}, acc ->
          IO.puts(Enum.at(Enum.at(board, i + row), j + cow))

          Solution.replace_sumbol(
            acc,
            i + row,
            j + cow,
            Enum.at(Enum.at(board, i + row), j + cow),
            Solution.find_sum_mins(board, i + row, j + cow)
          )
        end)
    end
  end

  def print_board(board) do
    Enum.reduce(0..0, 0, fn x, acc ->
      Enum.reduce(0..8, 0, fn y, acc ->
        board_one = Enum.at(board, x)
        elem = Enum.at(board, y)
        IO.puts(elem)
        acc
      end)
    end)
  end

  def find_sum_mins(board, i, j) do
    row = [0, 0, -1, 1, -1, -1, 1, 1]
    cow = [-1, 1, 0, 0, -1, 1, -1, 1]

    Enum.reduce(0..7, 0, fn x, acc ->
      if i + Enum.at(row, x) >= 0 and i + Enum.at(row, x) < length(board) do
        board_first = Enum.at(board, i + Enum.at(row, x))

        if j + Enum.at(cow, x) >= 0 and j + Enum.at(cow, x) < length(board_first) do
          k = Enum.at(board_first, j + Enum.at(cow, x))

          if k == "M" do
            acc + 1
          else
            acc
          end
        else
          acc
        end
      else
        acc
      end
    end)
  end

  def replace_sumbol(board, i, j, a, flag) when a == "E" do
    if flag > 0 do
      List.replace_at(board, i, List.replace_at(Enum.at(board, i), j, Integer.to_string(flag)))
    else
      Solution.dfs(List.replace_at(board, i, List.replace_at(Enum.at(board, i), j, "B")), i, j, a)
    end
  end

  def replace_sumbol(board, i, j, a, flag) do
    board
  end
end

# board = [["E","E","E","E","E"],["E","E","M","E","E"],["E","E","E","E","E"],["E","E","E","E","E"]]
board = [
  ["E", "M", "M", "2", "B", "B", "B", "B"],
  ["E", "E", "M", "2", "B", "B", "B", "B"],
  ["E", "E", "2", "1", "B", "B", "B", "B"],
  ["E", "M", "1", "B", "B", "B", "B", "B"],
  ["1", "2", "2", "1", "B", "B", "B", "B"],
  ["B", "1", "M", "1", "B", "B", "B", "B"],
  ["B", "1", "1", "1", "B", "B", "B", "B"],
  ["B", "B", "B", "B", "B", "B", "B", "B"]
]

# [0,0]

click = [0, 0]

Solution.print_board(board)

IO.puts("\n")

# board = Solution.update_board(board, click)

Solution.print_board(Solution.update_board(board, click))
