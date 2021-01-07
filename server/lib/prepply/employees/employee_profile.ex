defmodule Prepply.Employees.EmployeeProfile do
  use Ecto.Schema
  import Ecto.Changeset

  schema "employee_profiles" do
    field :mobile_number, :string
    field :name, :string
    belongs_to :user, Prepply.Accounts.User
    has_many :employee_checklists, Prepply.Employees.EmployeeChecklist

    timestamps()
  end

  @doc false
  def changeset(employee_profile, attrs) do
    employee_profile
    |> cast(attrs, [:name, :mobile_number])
    |> validate_required([:name, :mobile_number])
  end
end
