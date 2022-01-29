defmodule DriftDelivery.Repo.Migrations.ProductsBelongsToStore do
  use Ecto.Migration

  def change do
    alter table(:products) do
      add :store_id, references(:stores)
    end
  end
end
