defmodule Day01 do
    def find_most_calories(input) do
      input
      |> String.split("\n\n")
      |> Enum.map(&count_calories/1)
      |> Enum.max
    end

    def count_calories(calories) do
      calories
      |> String.split("\n", trim: true)
      |> Enum.map(&String.to_integer/1)
      |> Enum.reduce(fn x, acc -> x + acc end)
    end
end
