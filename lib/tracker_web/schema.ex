defmodule TrackerWeb.Schema do
  use Absinthe.Schema
  import_types Absinthe.Type.Custom
  import_types TrackerWeb.Schema.UserTypes
  import_types TrackerWeb.Schema.CampaignTypes
  import_types TrackerWeb.Schema.CommunicationTypes

  alias TrackerWeb.Resolvers

  query do
    @desc "Get all users"
    field :users, list_of(:user) do
      resolve &Resolvers.User.list_users/3
    end

    @desc "Get a user"
    field :user, :user do
      arg :id, non_null(:id)
      resolve &Resolvers.User.get_user/3
    end

    @desc "Get all campaigns"
    field :campaigns, list_of(:campaign) do
      resolve &Resolvers.Campaign.list_campaigns/3
    end

    @desc "Get a campaign"
    field :campaign, :campaign do
      arg :id, non_null(:id)
      resolve &Resolvers.Campaign.get_campaign/3
    end

    @desc "Get all calls"
    field :calls, list_of(:call) do
      resolve &Resolvers.Campaign.list_calls/3
    end

    @desc "Get a call"
    field :call, :call do
      arg :id, non_null(:id)
      resolve &Resolvers.Campaign.get_call/3
    end

    @desc "Get all notes"
    field :notes, list_of(:note) do
      resolve &Resolvers.Note.list_notes/3
    end

    @desc "Get a note"
    field :note, :note do
      arg :id, non_null(:id)
      resolve &Resolvers.Note.get_note/3
    end
  end
end
