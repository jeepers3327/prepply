defmodule Prepply.Repo do
  use Ecto.Repo,
    otp_app: :prepply,
    adapter: Ecto.Adapters.Postgres
end
