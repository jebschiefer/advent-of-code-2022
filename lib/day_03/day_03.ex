defmodule Day03 do
  def sum_priorities(input, chunk_size \\ 1) do
    input
    |> String.split("\n", trim: true)
    |> Enum.chunk_every(chunk_size)
    |> Enum.map(&get_single_rucksack_compartments/1)
    |> Enum.map(&find_duplicate/1)
    |> Enum.map(&get_character_value/1)
    |> Enum.reduce(fn x, acc -> x + acc end)
  end

  def get_single_rucksack_compartments(rucksacks) do
    cond do
      length(rucksacks) === 1 ->
        rucksacks =
          rucksacks
          |> hd
          |> String.graphemes()

        Enum.chunk_every(rucksacks, div(length(rucksacks), 2)) |> Enum.map(&Enum.join/1)

      true ->
        rucksacks
    end
  end

  def find_duplicate(rucksacks) do
    rucksacks
    |> Enum.map(&String.graphemes/1)
    |> Enum.reduce(fn x, acc ->
      MapSet.intersection(MapSet.new(x), MapSet.new(acc))
    end)
    |> MapSet.to_list()
    |> hd
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
