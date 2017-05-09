defmodule Slackbot.Bot do
  use Slack

  def handle_connect(slack, state) do
    IO.puts "Connected as #{slack.me.name}"
    {:ok, state}
  end

  def handle_event(message = %{type: "message"}, slack, state) do
    send_message("I listen you said: #{message.text}", message.channel, slack)
    {:ok, state}
  end

  def handle_event(_, _, state), do: {:ok, state}
end
