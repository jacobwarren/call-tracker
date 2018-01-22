defmodule TrackerWeb.Resolvers.Note do
  def list_notes(_parent, _args, _resolution) do
    {:ok, Tracker.Communication.list_notes()}
  end

  def get_note(_parent, %{id: id}, _resolution) do
    case Tracker.Communication.get_note!(id) do
      nil ->
        {:error, "Note ID #{id} not found"}
      user ->
        {:ok, user}
    end
  end
end
