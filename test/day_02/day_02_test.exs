defmodule Day02.Test do
  use ExUnit.Case

  test "day 2 part 1 example" do
    {:ok, input} = File.read("test/day_02/day_02_sample.txt")
    assert Day02.Part1.calculate_score(input) === 15
  end

  test "day 2 part 1" do
    {:ok, input} = File.read("test/day_02/day_02_input.txt")
    assert Day02.Part1.calculate_score(input) === 10994
  end

  test "day 2 part 2 example" do
    {:ok, input} = File.read("test/day_02/day_02_sample.txt")
    assert Day02.Part2.calculate_score(input) === 12
  end

  test "day 2 part 2" do
    {:ok, input} = File.read("test/day_02/day_02_input.txt")
    assert Day02.Part2.calculate_score(input) === 12526
  end
end
