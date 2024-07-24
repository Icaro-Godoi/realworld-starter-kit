defmodule Conduit.Articles.Article do
  alias Conduit.Users.User
  use Ecto.Schema

  schema "articles" do
    field :title, :string
    field :description, :string
    field :body, :string
    field :taglist, {:array, :string}

    belongs_to :user, User
  end
end
