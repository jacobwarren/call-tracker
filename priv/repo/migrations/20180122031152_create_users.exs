defmodule Tracker.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def change do
    create table(:users, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :name, :string, null: false
      add :email, :string, null: false
      add :password, :string, null: false
      add :role, :string, null: false, default: "account_executive" 
      add :deleted_at, :utc_datetime

      timestamps()
    end

  end
end
