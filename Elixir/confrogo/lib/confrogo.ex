defmodule Confrogo do
  @moduledoc """
  Documentation for `Confrogo`.
  """

  @doc """
  What am I called?

  ## Examples

    iex> Confrogo.me()
    "Confrogo"
  """
  def me, do: Application.get_env(:confrogo, :name)

  @doc """
  Greeting atom

  ## Examples

      iex> Confrogo.hello()
      :hi
  """
  def hello, do: :hi

  @doc """
  Confrogo's avatar atom

  ## Examples

      iex> Confrogo.avatar()
      :frog
  """
  def avatar, do: :frog

  @doc """
  Retrieves the value for the slack API token

  ## Examples

    iex> Confrogo.slack_token()
    "token must be specified in CF_SLACK_TOKEN"
  """
  def slack_token, do: Application.get_env(:confrogo, :slack_token)

  @doc """
  Retrieves the value for the slack API token

  ## Examples

    iex> Confrogo.slack_id()
    "app ID must be specified in CF_SLACK_APP_ID"
  """
  def slack_id, do: Application.get_env(:confrogo, :slack_app_id)
end
