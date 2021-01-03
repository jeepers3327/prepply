defmodule Prepply.EmployeesTest do
  use Prepply.DataCase

  alias Prepply.Employees

  describe "employee_profiles" do
    alias Prepply.Employees.EmployeeProfile

    @valid_attrs %{email: "some email", mobile_number: "some mobile_number", name: "some name"}
    @update_attrs %{
      email: "some updated email",
      mobile_number: "some updated mobile_number",
      name: "some updated name"
    }
    @invalid_attrs %{email: nil, mobile_number: nil, name: nil}

    def employee_profile_fixture(attrs \\ %{}) do
      {:ok, employee_profile} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Employees.create_employee_profile()

      employee_profile
    end

    test "list_employee_profiles/0 returns all employee_profiles" do
      employee_profile = employee_profile_fixture()
      assert Employees.list_employee_profiles() == [employee_profile]
    end

    test "get_employee_profile!/1 returns the employee_profile with given id" do
      employee_profile = employee_profile_fixture()
      assert Employees.get_employee_profile!(employee_profile.id) == employee_profile
    end

    test "create_employee_profile/1 with valid data creates a employee_profile" do
      assert {:ok, %EmployeeProfile{} = employee_profile} =
               Employees.create_employee_profile(@valid_attrs)

      assert employee_profile.email == "some email"
      assert employee_profile.mobile_number == "some mobile_number"
      assert employee_profile.name == "some name"
    end

    test "create_employee_profile/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Employees.create_employee_profile(@invalid_attrs)
    end

    test "update_employee_profile/2 with valid data updates the employee_profile" do
      employee_profile = employee_profile_fixture()

      assert {:ok, %EmployeeProfile{} = employee_profile} =
               Employees.update_employee_profile(employee_profile, @update_attrs)

      assert employee_profile.email == "some updated email"
      assert employee_profile.mobile_number == "some updated mobile_number"
      assert employee_profile.name == "some updated name"
    end

    test "update_employee_profile/2 with invalid data returns error changeset" do
      employee_profile = employee_profile_fixture()

      assert {:error, %Ecto.Changeset{}} =
               Employees.update_employee_profile(employee_profile, @invalid_attrs)

      assert employee_profile == Employees.get_employee_profile!(employee_profile.id)
    end

    test "delete_employee_profile/1 deletes the employee_profile" do
      employee_profile = employee_profile_fixture()
      assert {:ok, %EmployeeProfile{}} = Employees.delete_employee_profile(employee_profile)

      assert_raise Ecto.NoResultsError, fn ->
        Employees.get_employee_profile!(employee_profile.id)
      end
    end

    test "change_employee_profile/1 returns a employee_profile changeset" do
      employee_profile = employee_profile_fixture()
      assert %Ecto.Changeset{} = Employees.change_employee_profile(employee_profile)
    end
  end

  describe "employee_checklists" do
    alias Prepply.Employees.EmployeeChecklist

    @valid_attrs %{due_date: ~D[2010-04-17], file_path: "some file_path", status: "some status"}
    @update_attrs %{
      due_date: ~D[2011-05-18],
      file_path: "some updated file_path",
      status: "some updated status"
    }
    @invalid_attrs %{due_date: nil, file_path: nil, status: nil}

    def employee_checklist_fixture(attrs \\ %{}) do
      {:ok, employee_checklist} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Employees.create_employee_checklist()

      employee_checklist
    end

    test "list_employee_checklists/0 returns all employee_checklists" do
      employee_checklist = employee_checklist_fixture()
      assert Employees.list_employee_checklists() == [employee_checklist]
    end

    test "get_employee_checklist!/1 returns the employee_checklist with given id" do
      employee_checklist = employee_checklist_fixture()
      assert Employees.get_employee_checklist!(employee_checklist.id) == employee_checklist
    end

    test "create_employee_checklist/1 with valid data creates a employee_checklist" do
      assert {:ok, %EmployeeChecklist{} = employee_checklist} =
               Employees.create_employee_checklist(@valid_attrs)

      assert employee_checklist.due_date == ~D[2010-04-17]
      assert employee_checklist.file_path == "some file_path"
      assert employee_checklist.status == "some status"
    end

    test "create_employee_checklist/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Employees.create_employee_checklist(@invalid_attrs)
    end

    test "update_employee_checklist/2 with valid data updates the employee_checklist" do
      employee_checklist = employee_checklist_fixture()

      assert {:ok, %EmployeeChecklist{} = employee_checklist} =
               Employees.update_employee_checklist(employee_checklist, @update_attrs)

      assert employee_checklist.due_date == ~D[2011-05-18]
      assert employee_checklist.file_path == "some updated file_path"
      assert employee_checklist.status == "some updated status"
    end

    test "update_employee_checklist/2 with invalid data returns error changeset" do
      employee_checklist = employee_checklist_fixture()

      assert {:error, %Ecto.Changeset{}} =
               Employees.update_employee_checklist(employee_checklist, @invalid_attrs)

      assert employee_checklist == Employees.get_employee_checklist!(employee_checklist.id)
    end

    test "delete_employee_checklist/1 deletes the employee_checklist" do
      employee_checklist = employee_checklist_fixture()
      assert {:ok, %EmployeeChecklist{}} = Employees.delete_employee_checklist(employee_checklist)

      assert_raise Ecto.NoResultsError, fn ->
        Employees.get_employee_checklist!(employee_checklist.id)
      end
    end

    test "change_employee_checklist/1 returns a employee_checklist changeset" do
      employee_checklist = employee_checklist_fixture()
      assert %Ecto.Changeset{} = Employees.change_employee_checklist(employee_checklist)
    end
  end
end
