defmodule JsonReader do
  def get_contents(filename) do
    with {:ok, body} <- File.read(filename), do: {:ok, body}
  end
end

defmodule RandomQuote.JsonQuoteRepository do
  alias JsonReader
  require Enum
  import Quote

  # TODO: make configurable
  @repository_file Path.expand("./resources/quotes.json")

  def get_quotes() do
    with {:ok, body} <- JsonReader.get_contents(@repository_file),
         {:ok, items} <- Poison.decode(body, as: [%Quote{}]),
         do: {:ok, items}
  end
end
