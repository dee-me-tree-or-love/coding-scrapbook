defmodule RandomQuote.Router do
  use Plug.Router
  use Plug.Debugger
  require Logger
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
end
