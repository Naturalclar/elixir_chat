defmodule ElixirChatWeb.PageController do
  use ElixirChatWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
