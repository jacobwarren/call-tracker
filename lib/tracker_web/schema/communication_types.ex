defmodule TrackerWeb.Schema.CommunicationTypes do
  use Absinthe.Schema.Notation
  # use Absinthe.Relay.Schema.Notation, :modern
  use Absinthe.Ecto, repo: Tracker.Repo

  @desc "A note in a call"
  object :note do
    field :id, :id
    field :message, :string
    field :call_id, :id
    field :user_id, :id
    field :user, :user, resolve: assoc(:user)
  end
end
