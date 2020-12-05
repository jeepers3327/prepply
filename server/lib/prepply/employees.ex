defmodule Prepply.Employees do
  @moduledoc """
  The Employees context.
  """

  import Ecto.Query, warn: false
  alias Prepply.Repo

  alias Prepply.Employees.EmployeeProfile

  @doc """
  Returns the list of employee_profiles.

  ## Examples

      iex> list_employee_profiles()
      [%EmployeeProfile{}, ...]

  """
  def list_employee_profiles do
    Repo.all(EmployeeProfile)
  end

  @doc """
  Gets a single employee_profile.

  Raises `Ecto.NoResultsError` if the Employee profile does not exist.

  ## Examples

      iex> get_employee_profile!(123)
      %EmployeeProfile{}

      iex> get_employee_profile!(456)
      ** (Ecto.NoResultsError)

  """
  def get_employee_profile!(id), do: Repo.get!(EmployeeProfile, id)

  @doc """
  Creates a employee_profile.

  ## Examples

      iex> create_employee_profile(%{field: value})
      {:ok, %EmployeeProfile{}}

      iex> create_employee_profile(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_employee_profile(attrs \\ %{}) do
    %EmployeeProfile{}
    |> EmployeeProfile.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a employee_profile.

  ## Examples

      iex> update_employee_profile(employee_profile, %{field: new_value})
      {:ok, %EmployeeProfile{}}

      iex> update_employee_profile(employee_profile, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_employee_profile(%EmployeeProfile{} = employee_profile, attrs) do
    employee_profile
    |> EmployeeProfile.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a employee_profile.

  ## Examples

      iex> delete_employee_profile(employee_profile)
      {:ok, %EmployeeProfile{}}

      iex> delete_employee_profile(employee_profile)
      {:error, %Ecto.Changeset{}}

  """
  def delete_employee_profile(%EmployeeProfile{} = employee_profile) do
    Repo.delete(employee_profile)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking employee_profile changes.

  ## Examples

      iex> change_employee_profile(employee_profile)
      %Ecto.Changeset{data: %EmployeeProfile{}}

  """
  def change_employee_profile(%EmployeeProfile{} = employee_profile, attrs \\ %{}) do
    EmployeeProfile.changeset(employee_profile, attrs)
  end

  alias Prepply.Employees.EmployeeChecklist

  @doc """
  Returns the list of employee_checklists.

  ## Examples

      iex> list_employee_checklists()
      [%EmployeeChecklist{}, ...]

  """
  def list_employee_checklists do
    Repo.all(EmployeeChecklist)
  end

  @doc """
  Gets a single employee_checklist.

  Raises `Ecto.NoResultsError` if the Employee checklist does not exist.

  ## Examples

      iex> get_employee_checklist!(123)
      %EmployeeChecklist{}

      iex> get_employee_checklist!(456)
      ** (Ecto.NoResultsError)

  """
  def get_employee_checklist!(id), do: Repo.get!(EmployeeChecklist, id)

  @doc """
  Creates a employee_checklist.

  ## Examples

      iex> create_employee_checklist(%{field: value})
      {:ok, %EmployeeChecklist{}}

      iex> create_employee_checklist(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_employee_checklist(attrs \\ %{}) do
    %EmployeeChecklist{}
    |> EmployeeChecklist.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a employee_checklist.

  ## Examples

      iex> update_employee_checklist(employee_checklist, %{field: new_value})
      {:ok, %EmployeeChecklist{}}

      iex> update_employee_checklist(employee_checklist, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_employee_checklist(%EmployeeChecklist{} = employee_checklist, attrs) do
    employee_checklist
    |> EmployeeChecklist.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a employee_checklist.

  ## Examples

      iex> delete_employee_checklist(employee_checklist)
      {:ok, %EmployeeChecklist{}}

      iex> delete_employee_checklist(employee_checklist)
      {:error, %Ecto.Changeset{}}

  """
  def delete_employee_checklist(%EmployeeChecklist{} = employee_checklist) do
    Repo.delete(employee_checklist)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking employee_checklist changes.

  ## Examples

      iex> change_employee_checklist(employee_checklist)
      %Ecto.Changeset{data: %EmployeeChecklist{}}

  """
  def change_employee_checklist(%EmployeeChecklist{} = employee_checklist, attrs \\ %{}) do
    EmployeeChecklist.changeset(employee_checklist, attrs)
  end
end
