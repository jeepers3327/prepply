defmodule Prepply.Accounts.User do
  use Ecto.Schema
  import Ecto.Changeset

  schema "users" do
    field :password_hash, :string
    field :password, :string, virtual: true
    field :role, :string
    field :username, :string
    field :email, :string
    field :reset_password_token, :string

    has_one :employee_profile, Prepply.Employees.EmployeeProfile

    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:username, :password, :role, :email])
    |> validate_required([:username, :password, :email])
    |> unique_constraint([:username, :email])
    |> put_password_hash()
  end

  def reset_password_changeset(user, attrs) do
    user
    |> cast(attrs, [:reset_password_token])
  end

  defp put_password_hash(
         %Ecto.Changeset{valid?: true, changes: %{password: password}} = changeset
       ) do
    change(changeset, Argon2.add_hash(password))
  end

  defp put_password_hash(changeset), do: changeset
end
