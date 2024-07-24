defmodule Conduit.Repo.Migrations.AddArticlesTable do
  use Ecto.Migration

  def change do
    create table("articles") do
      add :title, :string, null: false
      add :description, :string, null: false
      add :body, :string, null: false
      add :taglist, {:array, :string}, null: false

      timestamps()
    end
  end
end
