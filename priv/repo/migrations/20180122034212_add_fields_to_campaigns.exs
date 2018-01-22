defmodule Tracker.Repo.Migrations.AddFieldsToCampaigns do
  use Ecto.Migration

  def change do
    alter table(:campaigns) do
      add :title, :string, null: false
    end
  end
end
