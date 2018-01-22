defmodule TrackerWeb.Schema.CommunicationTypes do
  use Absinthe.Schema.Notation

  @desc "A single note"
  object :note do
    field :id, :id
    field :message, :string
    field :user_id, :id
    field :call_id, :id
  end
end
