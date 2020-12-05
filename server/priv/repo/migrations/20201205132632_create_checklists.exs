defmodule Prepply.Repo.Migrations.CreateChecklists do
  use Ecto.Migration

  def change do
    create table(:checklists) do
      add :template_id, references(:checklist_templates, on_delete: :delete_all), null: false
      add :item_id, references(:checklist_items, on_delete: :delete_all), null: false

      timestamps()
    end

    create index(:checklists, [:template_id])
    create index(:checklists, [:item_id])
  end
end
