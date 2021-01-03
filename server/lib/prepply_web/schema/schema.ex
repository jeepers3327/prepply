defmodule PrepplyWeb.Schema do
  use Absinthe.Schema

  alias PrepplyWeb.Schema
  alias Prepply.Employees

  import_types(Schema.EmployeeTypes)

  query do
    import_fields(:get_employees)
  end

  mutation do
    import_fields(:create_employee)
  end

  def context(ctx) do
    loader =
      Dataloader.new()
      |> Dataloader.add_source(Employees, Employees.datasource())

    Map.put(ctx, :loader, loader)
  end

  def plugins do
    [Absinthe.Middleware.Dataloader] ++ Absinthe.Plugin.defaults()
  end
end
