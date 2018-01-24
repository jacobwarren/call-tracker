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
    field :temp_pass, :string, virtual: true
    field :password, :string
    field :role, :string

    has_many :campaigns, Tracker.Campaigns.Campaign
    has_many :notes, Tracker.Communication.Note

    timestamps()
  end

  def update_changeset(%User{} = user, attrs \\ %{}) do
    user
    |> cast(attrs, [:name, :email, :role], [:temp_pass])
    |> validate_required([:name, :email, :role])
    |> put_pass_hash()
  end

  def registration_changeset(%User{} = user, attrs \\ %{}) do
    user
    |> cast(attrs, [:name, :email, :role, :temp_pass])
    |> validate_required([:name, :email, :role, :temp_pass])
    |> put_pass_hash()
  end

  @doc false
  def changeset(%User{} = user, attrs) do
    user
    |> cast(attrs, [:name, :email, :password, :role, :deleted_at])
    |> validate_required([:name, :email, :password, :role, :deleted_at])
  end

  defp put_pass_hash(changeset) do
    case changeset do
      %Ecto.Changeset{valid?: true, changes: %{temp_pass: pass}} ->
        put_change(changeset, :password, Comeonin.Bcrypt.hashpwsalt(pass))
      _ ->
        changeset
    end
  end
end
