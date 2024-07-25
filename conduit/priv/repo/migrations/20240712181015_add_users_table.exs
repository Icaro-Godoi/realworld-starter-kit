defmodule Conduit.Repo.Migrations.AddUsersTable do
  use Ecto.Migration

  def change do
    create table("users") do
      add :username, :string, null: false
      add :email, :string, null: false
      add :password_hash, :string, null: false
      add :bio, :string, null: true
      add :image, :string, null: true

      timestamps()
    end

    create unique_index("users", [:email])
  end
end
