defmodule Confrogo.Router do
  use Plug.Router
  use Plug.Debugger
  require Logger

  plug(Plug.Logger, log: :debug)
  plug(Plug.Parsers, parsers: [:json], pass: ["application/json"], json_decoder: Jason)
  plug(:match)
  plug(:dispatch)

  # --------------------
  # Routes go below here
  # --------------------

  # Simple GET Request handler for path /hello
  get "/health" do
    send_resp(conn, 200, Confrogo.Messages.say(:health))
  end

  post "/events" do
    Logger.debug(conn.body_params)

    {status, body} =
      case conn.body_params do
        %{"event" => event} ->
          Confrogo.Handler.handle(event)
          |> make_response(%{result: "processed"})

        %{"type" => type, "challenge" => challenge} when type == "url_verification" ->
          make_response(:ok, %{result: "ok", challenge: challenge})

        _ ->
          make_response(:fail, %{result: "fail"})
      end

    send_resp(conn, status, body)
  end

  # Match all unknown routes
  match _ do
    send_resp(conn, 404, "oops...")
  end

  defp make_response(:ok, body), do: {200, make_json(body)}
  defp make_response(:fail, body), do: {400, make_json(body)}
  defp make_json(body), do: Jason.encode!(body)
end
