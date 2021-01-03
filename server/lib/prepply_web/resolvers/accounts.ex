defmodule PrepplyWeb.Resolvers.Accounts do
  alias Prepply.Accounts


  def signin(_, %{username: username, password: password}, _) do
    case Accounts.authenticate(username, password) do
      :error -> {:error, "Invalid credentials!"}
      {:ok, user} ->
        token = PrepplyWeb.AuthToken.sign(user)
        {:ok, %{token: token, user: user}}
    end
  end

  def me(_,_, %{context: %{current_user: user}}) do
    {:ok, user}
  end

  def me(_,_,_) do
    {:ok, nil}
  end
end
