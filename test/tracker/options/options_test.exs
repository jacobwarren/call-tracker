defmodule Tracker.OptionsTest do
  use Tracker.DataCase

  alias Tracker.Options

  describe "settings" do
    alias Tracker.Options.Setting

    @valid_attrs %{account_secret: "some account_secret", account_sid: "some account_sid", title: "some title"}
    @update_attrs %{account_secret: "some updated account_secret", account_sid: "some updated account_sid", title: "some updated title"}
    @invalid_attrs %{account_secret: nil, account_sid: nil, title: nil}

    def setting_fixture(attrs \\ %{}) do
      {:ok, setting} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Options.create_setting()

      setting
    end

    test "list_settings/0 returns all settings" do
      setting = setting_fixture()
      assert Options.list_settings() == [setting]
    end

    test "get_setting!/1 returns the setting with given id" do
      setting = setting_fixture()
      assert Options.get_setting!(setting.id) == setting
    end

    test "create_setting/1 with valid data creates a setting" do
      assert {:ok, %Setting{} = setting} = Options.create_setting(@valid_attrs)
      assert setting.account_secret == "some account_secret"
      assert setting.account_sid == "some account_sid"
      assert setting.title == "some title"
    end

    test "create_setting/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Options.create_setting(@invalid_attrs)
    end

    test "update_setting/2 with valid data updates the setting" do
      setting = setting_fixture()
      assert {:ok, setting} = Options.update_setting(setting, @update_attrs)
      assert %Setting{} = setting
      assert setting.account_secret == "some updated account_secret"
      assert setting.account_sid == "some updated account_sid"
      assert setting.title == "some updated title"
    end

    test "update_setting/2 with invalid data returns error changeset" do
      setting = setting_fixture()
      assert {:error, %Ecto.Changeset{}} = Options.update_setting(setting, @invalid_attrs)
      assert setting == Options.get_setting!(setting.id)
    end

    test "delete_setting/1 deletes the setting" do
      setting = setting_fixture()
      assert {:ok, %Setting{}} = Options.delete_setting(setting)
      assert_raise Ecto.NoResultsError, fn -> Options.get_setting!(setting.id) end
    end

    test "change_setting/1 returns a setting changeset" do
      setting = setting_fixture()
      assert %Ecto.Changeset{} = Options.change_setting(setting)
    end
  end
end
