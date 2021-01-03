defmodule PrepplyWeb.Resolvers.Employees do
  alias Prepply.Employees

  def list_employees(_args, _context) do
    {:ok, Employees.list_employee_profiles()}
  end

  def create_employee(args, _context) do
    case Employees.create_employee(args) do
      {:ok, %{profile: profile}} ->
        {:ok, profile}

      {:error, _failed_operation, _failed_value, _changes_so_far} ->
        {:error, "Could not create employee record!"}
    end
  end
end
