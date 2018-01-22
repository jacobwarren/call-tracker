defmodule TrackerWeb.Schema.CampaignTypes do
  use Absinthe.Schema.Notation

  @desc "A single campaign"
  object :campaign do
    field :id, :id
    field :title, :string
    field :description, :string
    field :masked_number, :string
    field :forward_number, :string
    field :deleted_at, :string
    field :user_id, :id
    field :calls, list_of(:call)
  end

  @desc "A single call"
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
    field :notes, list_of(:note)
  end
end
