defmodule Tracker.Repo.Migrations.CreateCalls do
  use Ecto.Migration

  def change do
    create table(:calls, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :from_number, :string
      add :from_city, :string
      add :from_state, :string
      add :from_zip, :string
      add :from_country, :string
      add :from_name, :string
      add :from_type, :string
      add :call_sid, :string
      add :call_status, :string
      add :recording_url, :string
      add :daleted_at, :utc_datetime
      add :campaign_id, references(:campaigns, on_delete: :nothing, type: :binary_id)

      timestamps()
    end

    create index(:calls, [:campaign_id])
  end
end
