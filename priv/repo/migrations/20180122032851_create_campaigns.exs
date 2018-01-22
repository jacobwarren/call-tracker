defmodule Tracker.Repo.Migrations.CreateCampaigns do
  use Ecto.Migration

  def change do
    create table(:campaigns, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :masked_number, :string, null: false
      add :forward_number, :string, null: false
      add :description, :text
      add :deleted_at, :utc_datetime
      add :user_id, references(:users, on_delete: :nothing, type: :binary_id), null: false

      timestamps()
    end

    create index(:campaigns, [:user_id])
  end
end
