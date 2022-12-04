defmodule Day04 do
  def count_covered_assignments(input) do
    input
    |> String.split("\n", trim: true)
    |> Enum.map(fn x -> String.split(x, ",", trim: true) end)
  end

  def create_assignment_from_range(range) do
    range
    |> String.split("-", trim: true)
    |> Enum.map(&String.to_integer/1)
    |> Enum.reduce(fn x, acc -> x..acc end)
    |> Enum.to_list()
    |> Enum.reverse()
  end
end
