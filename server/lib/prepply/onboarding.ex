defmodule Prepply.Onboarding do
  @moduledoc """
  The Onboarding context.
  """

  import Ecto.Query, warn: false
  alias Prepply.Repo

  alias Prepply.Onboarding.ChecklistItem

  @doc """
  Returns the list of checklist_items.

  ## Examples

      iex> list_checklist_items()
      [%ChecklistItem{}, ...]

  """
  def list_checklist_items do
    Repo.all(ChecklistItem)
  end

  @doc """
  Gets a single checklist_item.

  Raises `Ecto.NoResultsError` if the Checklist item does not exist.

  ## Examples

      iex> get_checklist_item!(123)
      %ChecklistItem{}

      iex> get_checklist_item!(456)
      ** (Ecto.NoResultsError)

  """
  def get_checklist_item!(id), do: Repo.get!(ChecklistItem, id)

  @doc """
  Creates a checklist_item.

  ## Examples

      iex> create_checklist_item(%{field: value})
      {:ok, %ChecklistItem{}}

      iex> create_checklist_item(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_checklist_item(attrs \\ %{}) do
    %ChecklistItem{}
    |> ChecklistItem.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a checklist_item.

  ## Examples

      iex> update_checklist_item(checklist_item, %{field: new_value})
      {:ok, %ChecklistItem{}}

      iex> update_checklist_item(checklist_item, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_checklist_item(%ChecklistItem{} = checklist_item, attrs) do
    checklist_item
    |> ChecklistItem.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a checklist_item.

  ## Examples

      iex> delete_checklist_item(checklist_item)
      {:ok, %ChecklistItem{}}

      iex> delete_checklist_item(checklist_item)
      {:error, %Ecto.Changeset{}}

  """
  def delete_checklist_item(%ChecklistItem{} = checklist_item) do
    Repo.delete(checklist_item)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking checklist_item changes.

  ## Examples

      iex> change_checklist_item(checklist_item)
      %Ecto.Changeset{data: %ChecklistItem{}}

  """
  def change_checklist_item(%ChecklistItem{} = checklist_item, attrs \\ %{}) do
    ChecklistItem.changeset(checklist_item, attrs)
  end
end
