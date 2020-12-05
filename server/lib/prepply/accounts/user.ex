defmodule Prepply.Accounts.User do
  use Ecto.Schema
  import Ecto.Changeset

  schema "users" do
    field :password_hash, :string
    field :role, :string
    field :username, :string

    has_one :employee_profile, Prepply.Employees.EmployeeProfile

    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:username, :password_hash, :role])
    |> validate_required([:username, :password_hash, :role])
  end
end
