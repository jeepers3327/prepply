defmodule Prepply.Repo.Migrations.CreateEmployeeProfiles do
  use Ecto.Migration

  def change do
    create table(:employee_profiles) do
      add :name, :string, null: false
      add :mobile_number, :string
      add :email, :string
      add :user_id, references(:users, on_delete: :delete_all), null: false

      timestamps()
    end

    create index(:employee_profiles, [:user_id])
  end
end
