defmodule ElixirChat.Repo do
  use Ecto.Repo,
    otp_app: :elixir_chat,
    adapter: Ecto.Adapters.Postgres
end
