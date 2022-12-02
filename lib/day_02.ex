defmodule Day02 do
  def calculate_score(input) do
    input
    |> String.split("\n", trim: true)
    |> Enum.map(&parse_round/1)
    |> Enum.map(&round_score/1)
    |> Enum.reduce(fn x, acc -> x + acc end)
  end

  def parse_round(input) do
    input
    |> String.split(" ", trim: true)
    |> Enum.map(&decrypt/1)
  end

  def decrypt(letter) do
    case letter do
      "A" -> :rock
      "B" -> :paper
      "C" -> :scissors
      "X" -> :rock
      "Y" -> :paper
      "Z" -> :scissors
    end
  end

  def round_score(matchup) do
    opponent = Enum.at(matchup, 0)
    player = Enum.at(matchup, 1)

    move_values = %{
      :rock => 1,
      :paper => 2,
      :scissors => 3
    }

    round_base = move_values[player]

    play = %{
      :rock => &play_rock/1,
      :paper => &play_paper/1,
      :scissors => &play_scissors/1
    }

    outcome = play[player].(opponent)

    case outcome do
      :win -> round_base + 6
      :lose -> round_base
      :tie -> round_base + 3
    end
  end

  def play_rock(against) do
    case against do
      :rock -> :tie
      :paper -> :lose
      :scissors -> :win
    end
  end

  def play_paper(against) do
    case against do
      :rock -> :win
      :paper -> :tie
      :scissors -> :lose
    end
  end

  def play_scissors(against) do
    case against do
      :rock -> :lose
      :paper -> :win
      :scissors -> :tie
    end
  end
end
