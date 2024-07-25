defmodule Conduit.Users do
  alias Conduit.Users.Create

  defdelegate create(params), to: Create, as: :call
end
