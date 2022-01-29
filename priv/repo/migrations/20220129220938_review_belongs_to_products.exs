defmodule DriftDelivery.Repo.Migrations.ReviewBelongsToProducts do
  use Ecto.Migration

  def change do
    alter table(:reviews) do
      add :product_id, references(:products)
    end
  end
end
