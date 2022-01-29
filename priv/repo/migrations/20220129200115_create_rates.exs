defmodule DriftDelivery.Repo.Migrations.CreateRates do
  use Ecto.Migration

  def change do
    create table("rates") do
      add :season, :string, null: false
      add :weather, :string, null: false
      add :temperature, :integer, null: false
      add :daypart, :string, null: false

      add :distance, :integer, null: false
      add :workload, :integer, default: 0

      add :mass, :integer, null: false
      add :volume, :integer, null: false
      add :shipping_amount, :integer, null: false

      timestamps()
    end
  end
end
