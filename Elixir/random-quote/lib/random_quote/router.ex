defmodule RandomQuote.QuoteRouter do
  use Plug.Router
  require Logger

  plug(Plug.Logger, log: :debug)
  plug(:match)
  plug(:dispatch)

  # --------------------
  # Routes go below here
  # --------------------

  # Simple GET Request handler for path /hello
  get "/random" do
    send_resp(conn, 200, "yo.")
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
end
