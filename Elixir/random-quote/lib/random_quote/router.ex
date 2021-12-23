defmodule RandomQuote.QuoteRouter do
  use Plug.Router
  require Logger
  require Enum

  # alias RandomQuote.Stubs, as: Stubs
  alias RandomQuote.JsonQuoteRepository, as: JsonQuoteRepository

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
    # TODO: figure out if it's possible to make it more concise (use Towel? or OK?)
    data = JsonQuoteRepository.get_quotes()

    result =
      case data do
        {:ok, items} -> Enum.random(items) |> Poison.encode()
        _ -> {:error, :not_found}
      end

    case result do
      {:ok, response} ->
        conn
        |> put_resp_content_type("application/json; charset=utf-8")
        |> send_resp(200, response)

      {:error, :not_found} ->
        conn
        |> send_resp(404, 'nothing was found...')

      _ ->
        conn
        |> send_resp(500, 'everything is broken!')
    end
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
