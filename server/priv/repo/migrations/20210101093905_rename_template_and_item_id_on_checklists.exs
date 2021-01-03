defmodule Prepply.Repo.Migrations.RenameTemplateAndItemIdOnChecklists do
  use Ecto.Migration

  def change do
    rename table("checklists"), :template_id, to: :checklist_template_id
    rename table("checklists"), :item_id, to: :checklist_item_id
  end
end
