defmodule Tracker.Accounts.User do
  use Ecto.Schema
  import Ecto.Changeset
  alias Tracker.Accounts.User


  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "users" do
    field :deleted_at, :utc_datetime
    field :email, :string
    field :name, :string
    field :password, :string
    field :role, :string

    has_many :campaigns, Tracker.Campaigns.Campaign
    has_many :notes, Tracker.Communication.Note

    timestamps()
  end

  @doc false
  def changeset(%User{} = user, attrs) do
    user
    |> cast(attrs, [:name, :email, :password, :role, :deleted_at])
    |> validate_required([:name, :email, :password, :role, :deleted_at])
  end
end
