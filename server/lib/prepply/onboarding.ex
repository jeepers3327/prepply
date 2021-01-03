defmodule Prepply.Onboarding do
  @moduledoc """
  The Onboarding context.
  """

  import Ecto.Query, warn: false
  alias Prepply.Repo
  alias Ecto.Multi

  alias Prepply.Onboarding.{Checklist, ChecklistItem, ChecklistTemplate}

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

  def create_checklist(attrs \\ %{}) do
    Multi.new()
    |> Multi.insert(:template, ChecklistTemplate.changeset(%ChecklistTemplate{}, attrs))
    |> Multi.merge(fn _ ->
      items = Map.get(attrs, "items")

      items
      |> Enum.with_index()
      |> Enum.reduce(Multi.new(), fn {item, idx}, multi ->
        Multi.insert(multi, {:item, idx}, ChecklistItem.changeset(%ChecklistItem{}, item))
      end)
    end)
    |> Multi.merge(fn result ->
      template = Map.get(result, :template)
      max = length(attrs["items"]) - 1

      0..max
      |> Enum.reduce(Multi.new(), fn id, multi ->
        item = Map.get(result, {:item, id})
        changeset = %Checklist{checklist_template_id: template.id, checklist_item_id: item.id}
        Multi.insert(multi, {:joined, id}, changeset)
      end)
    end)
    |> Repo.transaction()
  end
end
