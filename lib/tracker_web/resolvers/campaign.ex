defmodule TrackerWeb.Resolvers.Campaign do
  @doc """
  Request all campaigns.
  """
  def list_campaigns(_parent, _args, _resolution) do
    {:ok, Tracker.Campaigns.list_campaigns()}
  end

  @doc """
  Request a campaign by ID.
  """
  def get_campaign(_parent, %{id: id}, _resolution) do
    case Tracker.Campaigns.get_campaign!(id) do
      nil ->
        {:error, "Campaign ID #{id} not found"}
      user ->
        {:ok, user}
    end
  end

  @doc """
  Get all calls in campaign with matching ID.
  """
  def list_calls(%Tracker.Campaigns.Campaign{} = campaign, args, _resolution) do
    {:ok, Tracker.Campaigns.list_calls(campaign, args)}
  end

  @doc """
  Get all calls.
  """
  def list_calls(_parent, _args, _resolution) do
    {:ok, Tracker.Campaigns.list_calls()}
  end

  @doc """
  Get a call by ID.
  """
  def get_call(_parent, %{id: id}, _resolution) do
    case Tracker.Campaigns.get_call!(id) do
      nil ->
        {:error, "Call ID #{id} not found"}
      user ->
        {:ok, user}
    end
  end
end
