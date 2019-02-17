defmodule Memrise.Repo.Migrations.UpdateCoursesTable do
  use Ecto.Migration

  def change do
    alter table(:courses) do
      add :deleted, :boolean, default: false
    end

    create index(:courses, [:deleted])
  end
end
