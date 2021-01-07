defmodule Prepply.Repo.Migrations.AddResetPasswordTokenToUsers do
  use Ecto.Migration

  def change do
    alter table(:users) do
      add :reset_password_token, :string, null: false, default: ""
    end
  end
end
