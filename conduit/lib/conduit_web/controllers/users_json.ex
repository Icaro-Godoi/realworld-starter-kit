defmodule ConduitWeb.UsersJSON do
  alias Conduit.Users.User

  def create(%User{} = user) do
    %{
      "status" => :created,
      "user" => user
    }
  end
end
