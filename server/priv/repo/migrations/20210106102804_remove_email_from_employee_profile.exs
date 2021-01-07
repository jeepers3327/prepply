defmodule Prepply.Repo.Migrations.RemoveEmailFromEmployeeProfile do
  use Ecto.Migration

  def change do
    alter table(:employee_profiles) do
      remove :email
    end
  end
end
