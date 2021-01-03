defmodule PrepplyWeb.Schema.Helpers do
  def by_id(model, ids) do
    import Ecto.Query
    alias Prepply.Repo

    ids = ids |> Enum.uniq

    model
    |> where([m], m.id in ^ids)
    |> Repo.all
    |> Map.new(&{&1.id, &1})
  end
end
