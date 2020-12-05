defmodule Prepply.Repo.Migrations.CreateEmployeeChecklists do
  use Ecto.Migration

  def change do
    create table(:employee_checklists) do
      add :file_path, :string
      add :status, :string, null: false
      add :employee_id, references(:employee_profiles, on_delete: :delete_all), null: false
      add :item_id, references(:checklist_items, on_delete: :delete_all), null: false

      timestamps()
    end

    create index(:employee_checklists, [:employee_id])
    create index(:employee_checklists, [:item_id])
  end
end
