defmodule Conduit.Users.User do
  use Ecto.Schema

  schema "users" do
    field :username, :string
    field :emails, :string
    field :password, :string
    field :bio, :string
    field :image, :string

    # has_many :articles, Articles
    # has_many :comments, Comments
  end
end
