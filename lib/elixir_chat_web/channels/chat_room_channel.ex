alias ElixirChat.Chats

defmodule ElixirChatWeb.ChatRoomChannel do
  use ElixirChatWeb, :channel

  @impl true
  def join("chat_room:lobby", payload, socket) do
    {:ok, socket}
  end

  # It is also common to receive messages from the client and
  # broadcast to everyone in the current topic (chat_room:lobby).
  @impl true
  def handle_in("shout", payload, socket) do
    Chats.create_message(payload)
    broadcast socket, "shout", payload
    {:noreply, socket}
  end

  # Add authorization logic here as required.
  defp authorized?(_payload) do
    true
  end
end
