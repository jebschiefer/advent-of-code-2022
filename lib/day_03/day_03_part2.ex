defmodule Day03.Part2 do
  def sum_priorities(input) do
    input
    |> String.split("\n", trim: true)
    |> Enum.chunk_every(3)
    |> Enum.map(&find_duplicate/1)
    |> Enum.map(&get_character_value/1)
    |> Enum.reduce(fn x, acc -> x + acc end)
  end

  def find_duplicate(rucksacks) do
    rucksacks_characters = rucksacks |> Enum.map(&String.graphemes/1)

    first = Enum.at(rucksacks_characters, 0)
    second = Enum.at(rucksacks_characters, 1)
    third = Enum.at(rucksacks_characters, 2)

    (first -- first -- second -- second -- third) |> hd
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
