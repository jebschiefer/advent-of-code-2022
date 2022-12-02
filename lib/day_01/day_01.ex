defmodule Day01 do
  def find_most_calories(input) do
    find_most_calories(input, 1)
  end

  def find_most_calories(input, top_number_elves) do
    input
    |> String.split("\n\n")
    |> Enum.map(fn x -> string_to_integer_list(x) |> count_calories end)
    |> Enum.sort()
    |> Enum.reverse()
    |> Enum.slice(0..(top_number_elves - 1))
    |> count_calories
  end

  def string_to_integer_list(input) do
    input
    |> String.split("\n", trim: true)
    |> Enum.map(&String.to_integer/1)
  end

  def count_calories(calories) do
    calories
    |> Enum.reduce(fn x, acc -> x + acc end)
  end
end
