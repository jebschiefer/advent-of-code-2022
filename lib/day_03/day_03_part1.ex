defmodule Day03.Part1 do
  def sum_priorities(input) do
    input
    |> String.split("\n", trim: true)
    |> Enum.map(&find_duplicate/1)
    |> Enum.map(&get_character_value/1)
    |> Enum.reduce(fn x, acc -> x + acc end)
  end

  def find_duplicate(rucksack) do
    characters = rucksack |> String.graphemes()

    compartments = Enum.chunk_every(characters, div(length(characters), 2))

    first = List.first(compartments)
    second = List.last(compartments)

    (first -- first -- second) |> hd
  end

  def get_character_value(character) do
    lowercase_offset = 96
    capital_offset = 38

    lowercase_a = 97

    ascii = character |> String.to_charlist() |> hd

    cond do
      ascii >= lowercase_a -> ascii - lowercase_offset
      true -> ascii - capital_offset
    end
  end
end
