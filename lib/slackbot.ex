defmodule Slackbot do
  use Application

  def start(_type, _args) do
    import Supervisor.Spec, warn: false

    children = [
      worker(Slack.Bot, [Slackbot.Bot, [], Application.get_env(:slackbot, :slack_token)]),
    ]

    opts = [strategy: :one_for_one, name: Slackbot.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
