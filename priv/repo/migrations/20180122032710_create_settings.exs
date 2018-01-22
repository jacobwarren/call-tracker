defmodule Tracker.Repo.Migrations.CreateSettings do
  use Ecto.Migration

  def change do
    create table(:settings) do
      add :title, :string, null: false
      add :account_sid, :string, null: false
      add :account_secret, :string, null: false

      timestamps()
    end

  end
end
