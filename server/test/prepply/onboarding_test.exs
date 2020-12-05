defmodule Prepply.OnboardingTest do
  use Prepply.DataCase

  alias Prepply.Onboarding

  describe "checklist_items" do
    alias Prepply.Onboarding.ChecklistItem

    @valid_attrs %{is_online_submit: true, name: "some name"}
    @update_attrs %{is_online_submit: false, name: "some updated name"}
    @invalid_attrs %{is_online_submit: nil, name: nil}

    def checklist_item_fixture(attrs \\ %{}) do
      {:ok, checklist_item} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Onboarding.create_checklist_item()

      checklist_item
    end

    test "list_checklist_items/0 returns all checklist_items" do
      checklist_item = checklist_item_fixture()
      assert Onboarding.list_checklist_items() == [checklist_item]
    end

    test "get_checklist_item!/1 returns the checklist_item with given id" do
      checklist_item = checklist_item_fixture()
      assert Onboarding.get_checklist_item!(checklist_item.id) == checklist_item
    end

    test "create_checklist_item/1 with valid data creates a checklist_item" do
      assert {:ok, %ChecklistItem{} = checklist_item} = Onboarding.create_checklist_item(@valid_attrs)
      assert checklist_item.is_online_submit == true
      assert checklist_item.name == "some name"
    end

    test "create_checklist_item/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Onboarding.create_checklist_item(@invalid_attrs)
    end

    test "update_checklist_item/2 with valid data updates the checklist_item" do
      checklist_item = checklist_item_fixture()
      assert {:ok, %ChecklistItem{} = checklist_item} = Onboarding.update_checklist_item(checklist_item, @update_attrs)
      assert checklist_item.is_online_submit == false
      assert checklist_item.name == "some updated name"
    end

    test "update_checklist_item/2 with invalid data returns error changeset" do
      checklist_item = checklist_item_fixture()
      assert {:error, %Ecto.Changeset{}} = Onboarding.update_checklist_item(checklist_item, @invalid_attrs)
      assert checklist_item == Onboarding.get_checklist_item!(checklist_item.id)
    end

    test "delete_checklist_item/1 deletes the checklist_item" do
      checklist_item = checklist_item_fixture()
      assert {:ok, %ChecklistItem{}} = Onboarding.delete_checklist_item(checklist_item)
      assert_raise Ecto.NoResultsError, fn -> Onboarding.get_checklist_item!(checklist_item.id) end
    end

    test "change_checklist_item/1 returns a checklist_item changeset" do
      checklist_item = checklist_item_fixture()
      assert %Ecto.Changeset{} = Onboarding.change_checklist_item(checklist_item)
    end
  end
end
