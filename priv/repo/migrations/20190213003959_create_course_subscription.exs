defmodule Memrise.Repo.Migrations.CreateSubscriptions do
  use Ecto.Migration

  def change do
    create table(:course_subscriptions) do
      add :course_id, references(:courses, on_delete: :nothing)
      add :user_id, references(:users, on_delete: :nothing)

      timestamps()
    end

    create index(:course_subscriptions, [:course_id, :user_id])
  end
end
