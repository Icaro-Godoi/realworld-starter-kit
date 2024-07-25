defmodule Conduit.Users.Create do
  alias Conduit.Repo
  alias Conduit.Users.User

  def call(params) do
    params
    |> User.changeset()
    |> Repo.insert()
  end
end
