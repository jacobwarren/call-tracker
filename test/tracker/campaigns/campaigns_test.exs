defmodule Tracker.CampaignsTest do
  use Tracker.DataCase

  alias Tracker.Campaigns

  describe "campaigns" do
    alias Tracker.Campaigns.Campaign

    @valid_attrs %{deleted_at: "2010-04-17 14:00:00.000000Z", description: "some description", forward_number: "some forward_number", masked_number: "some masked_number"}
    @update_attrs %{deleted_at: "2011-05-18 15:01:01.000000Z", description: "some updated description", forward_number: "some updated forward_number", masked_number: "some updated masked_number"}
    @invalid_attrs %{deleted_at: nil, description: nil, forward_number: nil, masked_number: nil}

    def campaign_fixture(attrs \\ %{}) do
      {:ok, campaign} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Campaigns.create_campaign()

      campaign
    end

    test "list_campaigns/0 returns all campaigns" do
      campaign = campaign_fixture()
      assert Campaigns.list_campaigns() == [campaign]
    end

    test "get_campaign!/1 returns the campaign with given id" do
      campaign = campaign_fixture()
      assert Campaigns.get_campaign!(campaign.id) == campaign
    end

    test "create_campaign/1 with valid data creates a campaign" do
      assert {:ok, %Campaign{} = campaign} = Campaigns.create_campaign(@valid_attrs)
      assert campaign.deleted_at == DateTime.from_naive!(~N[2010-04-17 14:00:00.000000Z], "Etc/UTC")
      assert campaign.description == "some description"
      assert campaign.forward_number == "some forward_number"
      assert campaign.masked_number == "some masked_number"
    end

    test "create_campaign/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Campaigns.create_campaign(@invalid_attrs)
    end

    test "update_campaign/2 with valid data updates the campaign" do
      campaign = campaign_fixture()
      assert {:ok, campaign} = Campaigns.update_campaign(campaign, @update_attrs)
      assert %Campaign{} = campaign
      assert campaign.deleted_at == DateTime.from_naive!(~N[2011-05-18 15:01:01.000000Z], "Etc/UTC")
      assert campaign.description == "some updated description"
      assert campaign.forward_number == "some updated forward_number"
      assert campaign.masked_number == "some updated masked_number"
    end

    test "update_campaign/2 with invalid data returns error changeset" do
      campaign = campaign_fixture()
      assert {:error, %Ecto.Changeset{}} = Campaigns.update_campaign(campaign, @invalid_attrs)
      assert campaign == Campaigns.get_campaign!(campaign.id)
    end

    test "delete_campaign/1 deletes the campaign" do
      campaign = campaign_fixture()
      assert {:ok, %Campaign{}} = Campaigns.delete_campaign(campaign)
      assert_raise Ecto.NoResultsError, fn -> Campaigns.get_campaign!(campaign.id) end
    end

    test "change_campaign/1 returns a campaign changeset" do
      campaign = campaign_fixture()
      assert %Ecto.Changeset{} = Campaigns.change_campaign(campaign)
    end
  end

  describe "calls" do
    alias Tracker.Campaigns.Call

    @valid_attrs %{call_sid: "some call_sid", call_status: "some call_status", daleted_at: "2010-04-17 14:00:00.000000Z", from_city: "some from_city", from_country: "some from_country", from_name: "some from_name", from_number: "some from_number", from_state: "some from_state", from_type: "some from_type", from_zip: "some from_zip", recording_url: "some recording_url"}
    @update_attrs %{call_sid: "some updated call_sid", call_status: "some updated call_status", daleted_at: "2011-05-18 15:01:01.000000Z", from_city: "some updated from_city", from_country: "some updated from_country", from_name: "some updated from_name", from_number: "some updated from_number", from_state: "some updated from_state", from_type: "some updated from_type", from_zip: "some updated from_zip", recording_url: "some updated recording_url"}
    @invalid_attrs %{call_sid: nil, call_status: nil, daleted_at: nil, from_city: nil, from_country: nil, from_name: nil, from_number: nil, from_state: nil, from_type: nil, from_zip: nil, recording_url: nil}

    def call_fixture(attrs \\ %{}) do
      {:ok, call} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Campaigns.create_call()

      call
    end

    test "list_calls/0 returns all calls" do
      call = call_fixture()
      assert Campaigns.list_calls() == [call]
    end

    test "get_call!/1 returns the call with given id" do
      call = call_fixture()
      assert Campaigns.get_call!(call.id) == call
    end

    test "create_call/1 with valid data creates a call" do
      assert {:ok, %Call{} = call} = Campaigns.create_call(@valid_attrs)
      assert call.call_sid == "some call_sid"
      assert call.call_status == "some call_status"
      assert call.daleted_at == DateTime.from_naive!(~N[2010-04-17 14:00:00.000000Z], "Etc/UTC")
      assert call.from_city == "some from_city"
      assert call.from_country == "some from_country"
      assert call.from_name == "some from_name"
      assert call.from_number == "some from_number"
      assert call.from_state == "some from_state"
      assert call.from_type == "some from_type"
      assert call.from_zip == "some from_zip"
      assert call.recording_url == "some recording_url"
    end

    test "create_call/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Campaigns.create_call(@invalid_attrs)
    end

    test "update_call/2 with valid data updates the call" do
      call = call_fixture()
      assert {:ok, call} = Campaigns.update_call(call, @update_attrs)
      assert %Call{} = call
      assert call.call_sid == "some updated call_sid"
      assert call.call_status == "some updated call_status"
      assert call.daleted_at == DateTime.from_naive!(~N[2011-05-18 15:01:01.000000Z], "Etc/UTC")
      assert call.from_city == "some updated from_city"
      assert call.from_country == "some updated from_country"
      assert call.from_name == "some updated from_name"
      assert call.from_number == "some updated from_number"
      assert call.from_state == "some updated from_state"
      assert call.from_type == "some updated from_type"
      assert call.from_zip == "some updated from_zip"
      assert call.recording_url == "some updated recording_url"
    end

    test "update_call/2 with invalid data returns error changeset" do
      call = call_fixture()
      assert {:error, %Ecto.Changeset{}} = Campaigns.update_call(call, @invalid_attrs)
      assert call == Campaigns.get_call!(call.id)
    end

    test "delete_call/1 deletes the call" do
      call = call_fixture()
      assert {:ok, %Call{}} = Campaigns.delete_call(call)
      assert_raise Ecto.NoResultsError, fn -> Campaigns.get_call!(call.id) end
    end

    test "change_call/1 returns a call changeset" do
      call = call_fixture()
      assert %Ecto.Changeset{} = Campaigns.change_call(call)
    end
  end
end
