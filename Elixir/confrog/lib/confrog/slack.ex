defmodule Confrog.Slack do
  use Slack

  def handle_connect(slack) do
    IO.puts("Connected as #{slack.me.name}")
  end

  def handle_message(_message = %{type: "message", subtype: _}, _slack), do: :ok

  # ignore reply_to messages
  def handle_message(_message = %{type: "message", reply_to: _}, _slack), do: :ok

  def handle_message(message = %{type: "message"}, slack) do
    say_hello(message, slack)
  end

  def handle_message(_message, _slack), do: :ok

  defp say_hello(%{channel: channel}, slack) do
    send_message("Hello from #{slack.me.name}", channel, slack)
    :ok
  end
end
