defmodule DriftDelivery.Repo.Migrations.CreateProducts do
  use Ecto.Migration

  def change do
    create table("products") do
      add :full_name, :string, null: false
      add :brand, :string, null: false
      add :model, :string, null: false
      add :description, :string, null: false

      add :amount, :integer, null: false
      add :mass, :integer, null: false
      add :volume, :integer, null: false

      add :code, :string, null: false

      timestamps()
    end
  end
end
