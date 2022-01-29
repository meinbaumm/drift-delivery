defmodule DriftDelivery.Repo.Migrations.ReviewsBelongsToCustomers do
  use Ecto.Migration

  def change do
    alter table(:reviews) do
      add :customer_id, references(:customers)
    end
  end
end
