defmodule DriftDelivery.Repo.Migrations.DeliveryBelongsToCourierAndOrder do
  use Ecto.Migration

  def change do
    alter table(:deliveries) do
      add :order_id, references(:orders)
      add :courier_id, references(:couriers)
    end
  end
end
