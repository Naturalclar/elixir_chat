# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :elixir_chat,
  ecto_repos: [ElixirChat.Repo]

# Configures the endpoint
config :elixir_chat, ElixirChatWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "FlAG4HVQBPCkB0/Di5lit7s6urIy2GfJicv6skd9a21gBXCpPT41CbHK+LXDdz2n",
  render_errors: [view: ElixirChatWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: ElixirChat.PubSub,
  live_view: [signing_salt: "QdqJn513"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
