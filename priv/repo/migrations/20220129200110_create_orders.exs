defmodule DriftDelivery.Repo.Migrations.CreateOrders do
  use Ecto.Migration

  def change do
    create table("orders") do
      add :paycheck, :map
      add :payment_status, :string

      timestamps()
    end
  end
end
