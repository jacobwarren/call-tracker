defmodule TrackerWeb.Schema.UserTypes do
  use Absinthe.Schema.Notation

  @desc "A user with access to campaigns and calls"
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

  @desc "A login session"
  object :session do
    field :token, :string
  end
end
