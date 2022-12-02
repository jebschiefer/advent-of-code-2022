defmodule Day01.Test do
  use ExUnit.Case

  @example_input """
  1000
  2000
  3000

  4000

  5000
  6000

  7000
  8000
  9000

  10000
  """

  test "day 1 part 1 example" do
    assert Day01.find_most_calories(@example_input) === 24000
  end

  test "day 1 part 1" do
    {:ok, content} = File.read("test/day01_input.txt")
    assert Day01.find_most_calories(content) === 68467
  end

  test "day 1 part 2 example" do
    assert Day01.find_most_calories(@example_input, 3) === 45000
  end

  test "day 2 part 2" do
    {:ok, content} = File.read("test/day01_input.txt")
    assert Day01.find_most_calories(content, 3) === 203_420
  end
end
