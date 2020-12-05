defmodule Prepply.Onboarding.Checklist do
  use Ecto.Schema
  import Ecto.Changeset

  schema "checklists" do
    belongs_to :checklist_item, Prepply.Onboarding.ChecklistItem
    belongs_to :checklist_template, Prepply.Onboarding.ChecklistTemplate
    timestamps()
  end

  @doc false
  def changeset(checklist, attrs) do
    checklist
    |> cast(attrs, [])
    |> validate_required([])
  end
end
