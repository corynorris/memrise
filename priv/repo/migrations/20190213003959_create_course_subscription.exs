defmodule Memrise.Repo.Migrations.CreateSubscriptions do
  use Ecto.Migration

  def change do
    create table(:course_subscriptions) do
      add :course_id, references(:courses, on_delete: :nothing), primary_key: true
      add :user_id, references(:users, on_delete: :nothing), primary_key: true

      timestamps()
    end

    create unique_index(:course_subscriptions, [:course_id, :user_id], name: :unique_subscriptions)
  end
end
