defmodule Confrogo.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc "OTP Application specification for Confrogo"

  use Application
  require Logger

  @impl true
  def start(_type, _args) do
    children = [
      # Starts a worker by calling: Confrogo.Worker.start_link(arg)
      # {Confrogo.Worker, arg}
      Plug.Cowboy.child_spec(
        scheme: :http,
        plug: Confrogo.Router,
        options: [port: port()]
      )
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Confrogo.Supervisor]

    Logger.info("The server listening at port: #{port()}")
    Supervisor.start_link(children, opts)
  end

  # defp port(), do: Application.get_env(:app, :setup)[:port]
  defp port(), do: 8000
end
