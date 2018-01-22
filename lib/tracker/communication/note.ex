defmodule Tracker.Communication.Note do
  use Ecto.Schema
  import Ecto.Changeset
  alias Tracker.Communication.Note


  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "notes" do
    field :message, :string
    # field :call_id, :binary_id
    # field :user_id, :binary_id

    belongs_to :call, Tracker.Campaigns.Call
    belongs_to :user, Tracker.Accounts.User

    timestamps()
  end

  @doc false
  def changeset(%Note{} = note, attrs) do
    note
    |> cast(attrs, [:message])
    |> validate_required([:message])
  end
end
