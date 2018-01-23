defmodule TrackerWeb.Resolvers.User do
  @doc """
  Get all users.
  """
  def list_users(_parent, _args, _resolution) do
    {:ok, Tracker.Accounts.list_users()}
  end

  @doc """
  Get a user by ID.
  """
  def get_user(_parent, %{id: id}, _resolution) do
    case Tracker.Accounts.get_user!(id) do
      nil ->
        {:error, "User ID #{id} not found"}
      user ->
        {:ok, user}
    end
  end
end
