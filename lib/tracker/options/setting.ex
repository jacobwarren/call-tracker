defmodule Tracker.Options.Setting do
  use Ecto.Schema
  import Ecto.Changeset
  alias Tracker.Options.Setting


  schema "settings" do
    field :account_secret, :string
    field :account_sid, :string
    field :title, :string

    timestamps()
  end

  @doc false
  def changeset(%Setting{} = setting, attrs) do
    setting
    |> cast(attrs, [:title, :account_sid, :account_secret])
    |> validate_required([:title, :account_sid, :account_secret])
  end
end
