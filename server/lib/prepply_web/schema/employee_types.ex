defmodule PrepplyWeb.Schema.EmployeeTypes do
  use Absinthe.Schema.Notation
  import Absinthe.Resolution.Helpers, only: [dataloader: 3]

  alias Prepply.Employees
  alias PrepplyWeb.Resolvers

  object :employee do
    field :id, :id
    field :name, :string

    field :checklists, list_of(:checklist),
      resolve: dataloader(Employees, :employee_checklists, [])
  end

  object :checklist do
    field :id, :id
    field :status, :string
  end

  object :get_employees do
    field :employees, list_of(:employee) do
      resolve(&Resolvers.Employees.list_employees/2)
    end
  end

  object :create_employee do
    field :create_employee, :employee do
      arg(:username, non_null(:string))
      arg(:password, non_null(:string))
      arg(:email, non_null(:string))
      arg(:name, non_null(:string))
      arg(:mobile_number, non_null(:string))
      arg(:template_id, non_null(:integer))

      resolve(&Resolvers.Employees.create_employee/2)
    end
  end

  object :add_attachment do
    field :add_attachment, :boolean do
      arg(:attachments, non_null(:upload))

      resolve(&Resolvers.Employees.upload_attachment/2)
    end
  end
end
