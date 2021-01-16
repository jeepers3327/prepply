defmodule PrepplyWeb.Schema.AccountTypes do
  use Absinthe.Schema.Notation

  import Absinthe.Resolution.Helpers, only: [dataloader: 3]

  alias PrepplyWeb.Resolvers
  alias Prepply.Employees
  alias PrepplyWeb.Middlewares

  object :user do
    field :id, :id
    field :username, :string
    field :profile, :employee, resolve: dataloader(Employees, :employee_profile, [])
  end

  object :session do
    field :token, :string
    field :user, :user
  end

  object :result do
    field :message, non_null(:string)
  end

  object :signin do
    field :signin, :session do
      arg(:username, non_null(:string))
      arg(:password, non_null(:string))

      resolve(&Resolvers.Accounts.signin/3)
    end
  end

  object :forgot_password do
    field :forgot_password, :result do
      arg(:email, non_null(:string))
      resolve(&Resolvers.Accounts.send_reset_password/3)
    end
  end

  object :reset_password do
    field :reset_password, :result do
      arg(:reset_password_token, non_null(:string))
      resolve(&Resolvers.Accounts.reset_password/3)
    end
  end

  object :me do
    field :me, :user do
      middleware Middlewares.Authenticate
      resolve(&Resolvers.Accounts.me/3)
    end
  end
end
