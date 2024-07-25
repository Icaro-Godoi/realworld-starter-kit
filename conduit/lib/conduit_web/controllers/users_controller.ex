defmodule ConduitWeb.UsersController do
  alias Conduit.Users
  alias Conduit.Users.User
  use ConduitWeb, :controller

  # action_fallback ConduitWeb.FallbackController

  def create(conn, params) do
    with {:ok, %User{} = user} <- Users.create(params) do
      conn
      |> put_status(:created)
      |> render(:create, user: user)
    end
  end

  def login() do
  end

  def show() do
  end

  def update() do
  end
end
