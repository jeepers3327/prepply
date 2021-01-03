defmodule PrepplyWeb.Schema.AccountTypes do
  use Absinthe.Schema.Notation

  alias PrepplyWeb.Resolvers

  object :user do
    field :id, :id
    field :username, :string
    field :employee_profile, :employee
  end

  object :session do
    field :token, :string
    field :user, :user
  end

  object :signin do
    field :signin, :session do
      arg(:username, non_null(:string))
      arg(:password, non_null(:string))

      resolve(&Resolvers.Accounts.signin/3)
    end

  end

  object :me do
    field :me, :user do
      resolve(&Resolvers.Accounts.me/3)
    end
  end
end
