defmodule Conduit.Users do
  alias Conduit.Users.Create
  alias Conduit.Users.Login

  defdelegate create(params), to: Create, as: :call
  defdelegate login(params), to: Login, as: :call
end
