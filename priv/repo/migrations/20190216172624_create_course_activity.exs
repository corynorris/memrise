defmodule Memrise.Repo.Migrations.CreateCourseActivities do
  use Ecto.Migration

  def change do
    create table(:course_activities) do
      add :strength, :integer
      add :retries, :integer
      add :last_studied, :naive_datetime
      add :card_id, references(:cards, on_delete: :nothing)
      add :user_id, references(:users, on_delete: :nothing)

      timestamps()
    end

    create index(:course_activities, [:card_id])
    create index(:course_activities, [:user_id])
  end
end
