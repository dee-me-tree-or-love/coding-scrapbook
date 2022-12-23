defmodule Confrogo.Messages do
  @moduledoc "Configures Confrogo's message dictionary"

  def say(:frog) do
    ":frog:"
  end

  def say(:hi) do
    "hello!"
  end

  def say(:heart) do
    "<3"
  end

  def say(:health) do
    "It's OK #{say(health())}"
  end

  defp health, do: :heart
end
