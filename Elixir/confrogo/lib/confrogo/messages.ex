defmodule Confrogo.Messages do
  @moduledoc "Configures Confrogo's message dictionary"

  def message(:frog) do
    "🐸"
  end

  def message(:hi) do
    "hello!"
  end

  def message(:heart) do
    "<3"
  end

  def message(:health) do
    "It's OK #{message(Confrogo.health())}"
  end
end
