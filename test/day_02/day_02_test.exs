defmodule Day02.Test do
  use ExUnit.Case

  test "day 2 part 1 example" do
    {:ok, input} = File.read("test/day_02/day_02_sample.txt")
    assert Day02.calculate_score(input) === 15
  end

  test "day 2 part 1" do
    {:ok, input} = File.read("test/day_02/day_02_input.txt")
    assert Day02.calculate_score(input) === 15
  end
end
