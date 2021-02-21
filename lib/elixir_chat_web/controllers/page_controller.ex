defmodule ElixirChatWeb.PageController do
  use ElixirChatWeb, :controller

  alias ElixirChat.Chats

  def index(conn, _params) do
    messages = Chats.list_messages()
    render conn, "index.html", messages: messages
  end
end
