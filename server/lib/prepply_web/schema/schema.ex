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
    import_fields(:add_attachment)

    field :upload_file, :string do
      arg(:attachments, non_null(:upload))

      resolve(fn args, _ ->
        %Plug.Upload{path: path, filename: filename} = args.attachments

        # filepath = "#{path}/#{filename}"

        path
        |> ExAws.S3.Upload.stream_file()
        |> ExAws.S3.upload("prepplybucket", "attachments/#{filename}")
        |> ExAws.request()

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
