defmodule PrepplyWeb.AuthToken do
  @user_salt "Y578zs2dSWIOh9OwZLW1+MgmSf9HSdAIM5zXI/pUEMkHrdHFy83qKendvWtMichA"

  def sign(user) do
    Phoenix.Token.sign(PrepplyWeb.Endpoint, @user_salt, %{id: user.id})
  end

  def verify(token) do
    Phoenix.Token.verify(PrepplyWeb.Endpoint, @user_salt, token, max_age: 365 * 24 * 3600)
  end
end
