defmodule DriftDelivery.Repo.Migrations.CreateDeliveries do
  use Ecto.Migration

  def change do
    create table("deliveries") do
      add :cost, :integer, null: false
      add :rate, :integer, null: false
      add :duration, :integer

      timestamps()
    end
  end
end
