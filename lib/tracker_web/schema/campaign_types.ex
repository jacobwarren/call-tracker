defmodule TrackerWeb.Schema.CampaignTypes do
  use Absinthe.Schema.Notation

  alias TrackerWeb.Resolvers

  @desc "A marketing campaign"
  object :campaign do
    field :id, :id
    field :title, :string
    field :description, :string
    field :masked_number, :string
    field :forward_number, :string
    field :deleted_at, :string
    field :user_id, :id
    field :calls, list_of(:call) do
      arg :date, :date
      resolve &Resolvers.Campaign.list_calls/3
    end
  end

  @desc "A call from a campaign"
  object :call do
    field :id, :id
    field :from_number, :string
    field :from_city, :string
    field :from_state, :string
    field :from_zip, :string
    field :from_country, :string
    field :from_name, :string
    field :from_type, :string
    field :recording_url, :string
    field :call_sid, :string
    field :call_status, :string
    field :deleted_at, :string
    field :campaign, :campaign
    field :inserted_at, :naive_datetime
    field :notes, list_of(:note) do
      resolve &Resolvers.Note.list_notes/3
    end
  end
end
