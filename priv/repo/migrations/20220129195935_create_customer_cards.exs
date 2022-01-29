defmodule DriftDelivery.Repo.Migrations.CreateCustomerCards do
  use Ecto.Migration

  def change do
    create table("customer_cards") do
      add :number, :string, null: false
      add :valid_date, :date, null: false

      timestamps()
    end
  end
end
