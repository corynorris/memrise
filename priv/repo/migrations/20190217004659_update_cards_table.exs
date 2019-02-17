defmodule Memrise.Repo.Migrations.UpdateCardsTable do
  use Ecto.Migration

  def change do
    alter table(:cards) do
      add :deleted, :boolean, default: false
    end

    create index(:cards, [:deleted])
  end
end
