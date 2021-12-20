defmodule JsonReader do
  def get_contents(filename) do
    with {:ok, body} <- File.read(filename), {:ok, json} <- Poison.decode(body), do: {:ok, json}
  end
end

defmodule JsonQuoteRepository do
  # TODO: make configurable
  @repository_file "quotes.json"

  def adapt_quote(body) do
    # Adapt received json body to quote struct
  end

  def get_quotes() do
    # Retrieve all the quotes from JSON repo
  end
end
