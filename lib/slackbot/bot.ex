defmodule Slackbot.Bot do
  use Slack

  def handle_connect(slack, state) do
    IO.puts "Connected as #{slack.me.name}"
    {:ok, state}
  end

  def handle_event(message = %{text: "crash"}, slack, state) do
    dice = :rand.uniform(2)
    if dice == 1 do
      1/0 # Simulate fatal error by dividing by zero
    else
      send_message("I refuse to crash :p", message.channel, slack)
    end

    {:ok, state}
  end

  def handle_event(message = %{type: "message"}, slack, state) do
    send_message("I listen you said: #{message.text}", message.channel, slack)
    {:ok, state}
  end

  def handle_event(_, _, state), do: {:ok, state}
end
