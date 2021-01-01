defmodule Prepply.Employees.EmployeeChecklist do
  use Ecto.Schema
  import Ecto.Changeset

  schema "employee_checklists" do
    field :file_path, :string
    field :status, :string
    belongs_to :employee_profile, Prepply.Employees.EmployeeProfile
    belongs_to :checklist_item, Prepply.Onboarding.ChecklistItem

    timestamps()
  end

  @doc false
  def changeset(employee_checklist, attrs) do
    employee_checklist
    |> cast(attrs, [:file_path, :status])
    |> validate_required([:due_date, :file_path, :status])
  end
end
