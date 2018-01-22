defmodule TrackerWeb.Resolvers.User do
  def list_users(_parent, _args, _resolution) do
    {:ok, Tracker.Accounts.list_users()}
  end

  def get_user(_parent, %{id: id}, _resolution) do
    case Tracker.Accounts.get_user!(id) do
      nil ->
        {:error, "User ID #{id} not found"}
      user ->
        {:ok, user}
    end
  end
end
