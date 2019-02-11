defmodule Memrise.Repo.Migrations.CreateCourses do
  use Ecto.Migration

  def change do
    create table(:courses) do
      add :name, :string, null: false
      add :description, :string
      add :user_id, references(:users, on_delete: :nothing)

      timestamps()
    end

    create index(:courses, [:user_id])
  end
end
