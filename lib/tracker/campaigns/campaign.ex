defmodule Tracker.Campaigns.Campaign do
  use Ecto.Schema
  import Ecto.Changeset
  alias Tracker.Campaigns.Campaign


  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "campaigns" do
    field :deleted_at, :utc_datetime
    field :title, :string
    field :description, :string
    field :forward_number, :string
    field :masked_number, :string
    # field :user_id, :binary_id

    belongs_to :user, Tracker.Accounts.User
    has_many :calls, Tracker.Campaigns.Call

    timestamps()
  end

  @doc false
  def changeset(%Campaign{} = campaign, attrs) do
    campaign
    |> cast(attrs, [:title, :masked_number, :forward_number, :description, :deleted_at])
    |> validate_required([:title, :masked_number, :forward_number, :description, :deleted_at])
  end
end
