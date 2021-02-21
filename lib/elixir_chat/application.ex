defmodule ElixirChat.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      ElixirChat.Repo,
      # Start the Telemetry supervisor
      ElixirChatWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: ElixirChat.PubSub},
      # Start the Endpoint (http/https)
      ElixirChatWeb.Endpoint
      # Start a worker by calling: ElixirChat.Worker.start_link(arg)
      # {ElixirChat.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: ElixirChat.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    ElixirChatWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
