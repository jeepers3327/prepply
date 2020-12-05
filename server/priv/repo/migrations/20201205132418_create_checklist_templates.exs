defmodule Prepply.Repo.Migrations.CreateChecklistTemplates do
  use Ecto.Migration

  def change do
    create table(:checklist_templates) do
      add :name, :string, null: false

      timestamps()
    end

  end
end
