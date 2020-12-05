defmodule Prepply.Repo.Migrations.CreateChecklistItems do
  use Ecto.Migration

  def change do
    create table(:checklist_items) do
      add :name, :string, null: false
      add :is_online_submit, :boolean, default: false, null: false

      timestamps()
    end

  end
end
