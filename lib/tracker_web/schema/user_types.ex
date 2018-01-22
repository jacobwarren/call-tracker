defmodule TrackerWeb.Schema.UserTypes do
  use Absinthe.Schema.Notation

  @desc "A single user"
  object :user do
    field :id, :id
    field :name, :string
    field :email, :string
    field :password, :string
    field :role, :string
    field :deleted_at, :string
    field :campaigns, list_of(:campaign)
    field :notes, list_of(:note)
  end
end
