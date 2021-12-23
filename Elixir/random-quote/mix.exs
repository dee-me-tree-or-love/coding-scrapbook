defmodule RandomQuote.MixProject do
  use Mix.Project

  def project do
    [
      app: :random_quote,
      version: "0.1.0",
      elixir: "~> 1.13",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # TODO: how to get the code recompiling on source change???

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger, :cowboy, :plug, :poison],
      mod: {RandomQuote.Application, []}
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [{:plug_cowboy, "~> 2.0"}, {:poison, "~> 3.1"}]
  end
end
