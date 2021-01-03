defmodule Prepply.Repo.Migrations.RenameEmployeeAndItemIdOnEmployeeChecklists do
  use Ecto.Migration

  def change do
    rename table("employee_checklists"), :employee_id, to: :employee_profile_id
    rename table("employee_checklists"), :item_id, to: :checklist_item_id
  end
end
