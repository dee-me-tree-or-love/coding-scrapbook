defmodule Confrogo.Handler do
  @moduledoc "Handles incoming events"
  use Slack
  require Logger

  alias Confrogo.Messages, as: Messages

  def handle(event) do
    Logger.info("Handling incoming event")
    handle_item(event)
  end

  defp handle_item(%{
         "channel_type" => "im",
         "type" => "message",
         "app_id" => app_id
       }) do
    Logger.info("Ignoring app messages.")
    Logger.debug("Ignored app ID: #{app_id}")
    :ok
  end

  defp handle_item(%{
         "text" => text,
         "channel" => channel,
         "channel_type" => "im",
         "type" => "message"
       }) do
    Slack.Web.Chat.post_message(
      channel,
      "> #{text}\nHello there! My name is *#{Confrogo.me()}*. And I am a #{Messages.say(Confrogo.avatar())}",
      %{token: Confrogo.slack_token()}
    )
    |> process_response
  end

  defp handle_item(_) do
    :fail
  end

  defp process_response(r = %{"error" => error}) do
    Logger.debug(r)
    Logger.error(error)
    :fail
  end

  defp process_response(r = _) do
    Logger.debug(r)
    :ok
  end
end
