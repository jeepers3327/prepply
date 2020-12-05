defmodule Prepply.Onboarding.ChecklistItem do
  use Ecto.Schema
  import Ecto.Changeset

  schema "checklist_items" do
    field :is_online_submit, :boolean, default: false
    field :name, :string

    has_many :checklists, Prepply.Onboarding.Checklist

    timestamps()
  end

  @doc false
  def changeset(checklist_item, attrs) do
    checklist_item
    |> cast(attrs, [:name, :is_online_submit])
    |> validate_required([:name, :is_online_submit])
  end
end
