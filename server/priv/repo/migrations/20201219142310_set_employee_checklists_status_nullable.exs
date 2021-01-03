defmodule Prepply.Repo.Migrations.SetEmployeeChecklistsStatusNullable do
  use Ecto.Migration

  def change do
    alter table(:employee_checklists) do
      modify :status, :string, null: true, default: ""
    end
  end
end
