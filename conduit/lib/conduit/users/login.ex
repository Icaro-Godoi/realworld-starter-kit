defmodule Conduit.Users.Login do
  alias Conduit.Users.User
  alias Conduit.Repo

  def call(%{"username" => username, "password" => password}) do
    case Repo.get_by(User, username: username) do
      %User{} = user -> do_validation(password, user)
      nil -> {:error, :not_found}
    end
  end

  defp do_validation(password, user) do
    case Pbkdf2.verify_pass(password, user.password_hash) do
      true -> {:ok, user}
      false -> {:error, :invalid_user}
    end
  end
end
