defmodule RandomQuote.QuoteRouter do
  use Plug.Router
  require Logger
  require Enum

  alias RandomQuote.Stubs, as: Stubs

  plug(Plug.Logger, log: :debug)

  # responsible for matching routes
  plug(:match)
  # responsible for json parsing after route match
  plug(Plug.Parsers, parsers: [:json], json_decoder: Poison)
  # responsible for dispatching responses
  plug(:dispatch)

  # --------------------
  # Routes go below here
  # --------------------

  # Simple GET Request handler for path /hello
  get "/random" do
    with {:ok, items} <- Stubs.get_quotes(),
         {:ok, response} <- Enum.random(items) |> Poison.encode(),
         do:
           conn
           |> put_resp_content_type("application/json; charset=utf-8")
           |> send_resp(200, response)
  end
end

defmodule RandomQuote.Router do
  use Plug.Router
  use Plug.Debugger
  require Logger

  # NB: aliased modules in the same folder should be defined above
  alias RandomQuote.QuoteRouter, as: QuoteRouter

  plug(Plug.Logger, log: :debug)
  plug(:match)
  plug(:dispatch)

  # --------------------
  # Routes go below here
  # --------------------

  # Simple GET Request handler for path /hello
  get "/health" do
    send_resp(conn, 200, "It's ok.")
  end

  # Forward routes to QuoteRouter
  forward("/quotes", to: QuoteRouter)

  # Match all unknown routes
  match _ do
    send_resp(conn, 404, "oops...")
  end
end
