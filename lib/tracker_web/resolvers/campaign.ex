defmodule TrackerWeb.Resolvers.Campaign do
  def list_campaigns(_parent, _args, _resolution) do
    {:ok, Tracker.Campaigns.list_campaigns()}
  end

  def get_campaign(_parent, %{id: id}, _resolution) do
    case Tracker.Campaigns.get_campaign!(id) do
      nil ->
        {:error, "Campaign ID #{id} not found"}
      user ->
        {:ok, user}
    end
  end

  def list_calls(_parent, _args, _resolution) do
    {:ok, Tracker.Campaigns.list_calls()}
  end

  def get_call(_parent, %{id: id}, _resolution) do
    case Tracker.Campaigns.get_call!(id) do
      nil ->
        {:error, "Call ID #{id} not found"}
      user ->
        {:ok, user}
    end
  end
end
