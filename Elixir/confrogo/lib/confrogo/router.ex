defmodule Confrogo.Router do
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
    send_resp(conn, 200, Confrogo.Messages.message(:health))
  end

  # Match all unknown routes
  match _ do
    send_resp(conn, 404, "oops...")
  end
end
