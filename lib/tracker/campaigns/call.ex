defmodule Tracker.Campaigns.Call do
  use Ecto.Schema
  import Ecto.Changeset
  alias Tracker.Campaigns.Call


  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "calls" do
    field :call_sid, :string
    field :call_status, :string
    field :daleted_at, :utc_datetime
    field :from_city, :string
    field :from_country, :string
    field :from_name, :string
    field :from_number, :string
    field :from_state, :string
    field :from_type, :string
    field :from_zip, :string
    field :recording_url, :string
    # field :campaign_id, :binary_id

    belongs_to :campaign, Tracker.Campaigns.Campaign
    has_many :notes, Tracker.Communication.Note

    timestamps()
  end

  @doc false
  def changeset(%Call{} = call, attrs) do
    call
    |> cast(attrs, [:from_number, :from_city, :from_state, :from_zip, :from_country, :from_name, :from_type, :call_sid, :call_status, :recording_url, :daleted_at])
    |> validate_required([:from_number, :from_city, :from_state, :from_zip, :from_country, :from_name, :from_type, :call_sid, :call_status, :recording_url, :daleted_at])
  end
end
