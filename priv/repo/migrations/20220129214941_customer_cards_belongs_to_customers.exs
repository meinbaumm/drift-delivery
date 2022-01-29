defmodule DriftDelivery.Repo.Migrations.CustomerCardsBelongsToCustomers do
  use Ecto.Migration

  def change do
    alter table(:customer_cards) do
      add :customer_id, references(:customers)
    end
  end
end
