defmodule Tracker.Repo.Migrations.AddIndexForCampaignTitles do
  use Ecto.Migration

  def change do
    create unique_index(:campaigns, [:title])
  end
end
