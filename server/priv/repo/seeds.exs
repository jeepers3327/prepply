# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Prepply.Repo.insert!(%Prepply.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

alias Prepply.Onboarding
alias Prepply.Employees

checklist = %{
  "name" => "Default",
  "items" => [%{"name" => "NBI Clearance"}, %{"name" => "Postal ID"}]
}

Onboarding.create_checklist(checklist)

acc1 = %{
  "username" => "j.sajot",
  "password" => "test1234",
  "email" => "j.sajot@gmail.com",
  "name" => "Jhefrey Sajot",
  "mobile_number" => "09290393532",
  "template_id" => "1"
}

Employees.create_employee(acc1)

acc2 = %{
  "username" => "j.sajot2",
  "password" => "test1234",
  "email" => "j.sajot@gmail.com",
  "name" => "Sajot Jhefrey",
  "mobile_number" => "09290393532",
  "template_id" => "1"
}

Employees.create_employee(acc2)
