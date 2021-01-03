defmodule Prepply.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :username, :string, null: false
      add :password_hash, :string, null: false
      add :role, :string, default: "user"

      timestamps()
    end
  end
end
