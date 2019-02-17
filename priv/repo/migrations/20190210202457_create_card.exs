defmodule Memrise.Repo.Migrations.CreateCard do
  use Ecto.Migration

  def change do
    create table(:cards) do
      add :image, :string
      add :front, :string, null: false
      add :back, :string, null: false
      add :hint, :string
      add :course_id, references(:courses, on_delete: :delete_all)

      timestamps()
    end

    create index(:cards, [:course_id])
  end
end
