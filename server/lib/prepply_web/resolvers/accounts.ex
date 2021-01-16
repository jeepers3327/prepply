defmodule PrepplyWeb.Resolvers.Accounts do
  alias Prepply.Accounts
  alias Prepply.Accounts.Email
  alias Prepply.Mailer

  def signin(_, %{username: username, password: password}, _) do
    case Accounts.authenticate(username, password) do
      :error ->
        {:error, "Invalid credentials!"}

      {:ok, user} ->
        token = PrepplyWeb.AuthToken.sign(user)
        {:ok, %{token: token, user: user}}
    end
  end

  def send_reset_password(_, %{email: email}, _) do
    case Accounts.get_user_by_email(email) do
      nil ->
        {:error, "Email not found!"}

      user ->
        case Accounts.set_reset_password_token(user) do
          :error ->
            {:error, "Cannot reset password!"}

          user ->
            user
            |> Email.reset_password_email()
            |> Mailer.deliver_later()

            {:ok, %{message: "Reset password email sent!"}}
        end
    end
  end

  def reset_password(_, %{reset_password_token: token, new_password: password}, _) do
    case Accounts.reset_password(token, password) do
      {:error, :token_not_found} -> {:error, %{message: "Invalid reset token!"}}
      {:error, _user} -> {:error, %{message: "An error occured!"}}
      {:ok, _user} -> {:ok, %{message: "Password has been reset!"}}
    end
  end

  def me(_, _, %{context: %{current_user: user}}) do
    {:ok, user}
  end

  def me(_, _, _) do
    {:ok, nil}
  end
end
