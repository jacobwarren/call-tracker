defmodule TrackerWeb.Resolvers.Note do
  @doc """
  Get all notes in call with matching ID.
  """
  def list_notes(%Tracker.Campaigns.Call{} = call, args, _resolution) do
    {:ok, Tracker.Communication.list_notes(call, args)}
  end

  @doc """
  Get all notes.
  """
  def list_notes(_parent, _args, _resolution) do
    {:ok, Tracker.Communication.list_notes()}
  end

  @doc """
  Get a note by ID.
  """
  def get_note(_parent, %{id: id}, _resolution) do
    case Tracker.Communication.get_note!(id) do
      nil ->
        {:error, "Note ID #{id} not found"}
      user ->
        {:ok, user}
    end
  end
end
