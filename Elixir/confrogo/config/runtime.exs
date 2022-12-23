import Config

config :confrogo,
  # lookup the slack details in the App's configuration page
  slack_token: System.get_env("CF_SLACK_TOKEN", "token must be specified in CF_SLACK_TOKEN"),
  slack_app_id: System.get_env("CF_SLACK_APP_ID", "app ID must be specified in CF_SLACK_APP_ID")
