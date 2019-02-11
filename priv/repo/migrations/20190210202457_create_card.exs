defmodule Memrise.Repo.Migrations.CreateCard do
  use Ecto.Migration

  def change do
    create table(:card) do
      add :image, :string
      add :front, :string, null: false
      add :back, :string, null: false
      add :hint, :string
      add :course_id, references(:courses, on_delete: :nothing)

      timestamps()
    end

    create index(:card, [:course_id])
  end
end
