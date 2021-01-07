defmodule Prepply.Accounts.Email do
  import Bamboo.Email

  alias Prepply.Accounts.User

  def reset_password_email(%User{email: email}) do
    new_email()
    |> from("jhefreysajot@gmail.com")
    |> to(email)
    |> subject("Reset your password")
    |> Bamboo.MailgunHelper.template("prepply_app")
    |> Bamboo.MailgunHelper.substitute_variables(%{"reset_link" => "test"})
  end
end
