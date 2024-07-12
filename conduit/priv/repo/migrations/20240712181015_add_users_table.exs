defmodule Conduit.Repo.Migrations.AddUsersTable do
  use Ecto.Migration

  def change do
    create table("users") do
      add :username, :string, null: false
      add :email, :string, null: false
      add :password, :string, null: false
      add :bio, :string
      add :image, :string

      timestamps()
    end
  end
end
