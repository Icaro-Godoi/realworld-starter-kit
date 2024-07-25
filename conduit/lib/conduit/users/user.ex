defmodule Conduit.Users.User do
  use Ecto.Schema
  import Ecto.Changeset

  alias Conduit.Articles.Article

  @required_params [:username, :email, :password]

  schema "users" do
    field :username, :string
    field :email, :string
    field :password, :string, virtual: true
    field :password_hash, :string
    field :bio, :string
    field :image, :string

    has_many :articles, Article
    # has_many :comments, Comments

    timestamps()
  end

  def changeset(params) do
    %__MODULE__{}
    |> cast(params, @required_params)
    |> do_validations(@required_params)
    |> add_password_hash()
  end

  defp do_validations(user, fields) do
    user
    |> validate_required(fields)
    |> validate_length(:username, min: 3, max: 20)
    |> validate_format(:email, ~r/@/)
    |> validate_length(:password, min: 8)
    |> unique_constraint(:email)
  end

  defp add_password_hash(
         %Ecto.Changeset{valid?: true, changes: %{password: password}} = changeset
       ) do
    change(changeset, handle_hash(password))
  end

  defp add_password_hash(changeset), do: changeset

  defp handle_hash(password) do
    hash = Pbkdf2.hash_pwd_salt(password)
    %{password_hash: hash, password: nil}
  end
end
