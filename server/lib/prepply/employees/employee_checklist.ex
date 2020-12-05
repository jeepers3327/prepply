defmodule Prepply.Employees.EmployeeChecklist do
  use Ecto.Schema
  import Ecto.Changeset

  schema "employee_checklists" do
    field :file_path, :string
    field :status, :string
    field :employee_id, :id
    field :item_id, :id

    timestamps()
  end

  @doc false
  def changeset(employee_checklist, attrs) do
    employee_checklist
    |> cast(attrs, [:file_path, :status])
    |> validate_required([:due_date, :file_path, :status])
  end
end
