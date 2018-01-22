defmodule Tracker.CommunicationTest do
  use Tracker.DataCase

  alias Tracker.Communication

  describe "notes" do
    alias Tracker.Communication.Note

    @valid_attrs %{message: "some message"}
    @update_attrs %{message: "some updated message"}
    @invalid_attrs %{message: nil}

    def note_fixture(attrs \\ %{}) do
      {:ok, note} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Communication.create_note()

      note
    end

    test "list_notes/0 returns all notes" do
      note = note_fixture()
      assert Communication.list_notes() == [note]
    end

    test "get_note!/1 returns the note with given id" do
      note = note_fixture()
      assert Communication.get_note!(note.id) == note
    end

    test "create_note/1 with valid data creates a note" do
      assert {:ok, %Note{} = note} = Communication.create_note(@valid_attrs)
      assert note.message == "some message"
    end

    test "create_note/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Communication.create_note(@invalid_attrs)
    end

    test "update_note/2 with valid data updates the note" do
      note = note_fixture()
      assert {:ok, note} = Communication.update_note(note, @update_attrs)
      assert %Note{} = note
      assert note.message == "some updated message"
    end

    test "update_note/2 with invalid data returns error changeset" do
      note = note_fixture()
      assert {:error, %Ecto.Changeset{}} = Communication.update_note(note, @invalid_attrs)
      assert note == Communication.get_note!(note.id)
    end

    test "delete_note/1 deletes the note" do
      note = note_fixture()
      assert {:ok, %Note{}} = Communication.delete_note(note)
      assert_raise Ecto.NoResultsError, fn -> Communication.get_note!(note.id) end
    end

    test "change_note/1 returns a note changeset" do
      note = note_fixture()
      assert %Ecto.Changeset{} = Communication.change_note(note)
    end
  end
end
