defmodule DriftDelivery.Repo.Migrations.OrdersBelongsToCustomers do
  use Ecto.Migration

  def change do
    alter table(:orders) do
      add :customer_id, references(:customers)
    end
  end
end
