defmodule Prepply.Onboarding.ChecklistTemplate do
  use Ecto.Schema
  import Ecto.Changeset

  schema "checklist_templates" do
    field :name, :string

    has_many :checklists, Prepply.Onboarding.Checklist
    timestamps()
  end

  @doc false
  def changeset(checklist_template, attrs) do
    checklist_template
    |> cast(attrs, [:name])
    |> validate_required([:name])
  end
end
