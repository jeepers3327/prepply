defmodule PrepplyWeb.Schema do
  use Absinthe.Schema

  alias PrepplyWeb.Schema
  alias Prepply.Employees

  import_types(Schema.EmployeeTypes)
  import_types(Schema.AccountTypes)
  import_types(Absinthe.Plug.Types)

  query do
    import_fields(:get_employees)
  end

  mutation do
    import_fields(:create_employee)
    import_fields(:signin)

    import_fields(:forgot_password)

    field :upload_file, :string do
      arg(:attachments, non_null(:upload))
      arg(:metadata, :upload)

      resolve(fn args, _ ->
        #TODO: file upload
        args.attachments
        {:ok, "success"}
      end)
    end
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
