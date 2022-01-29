defmodule DriftDelivery.Repo.Migrations.CreateStores do
  use Ecto.Migration

  def change do
    create table("stores") do
      add :name, :string, null: false
      add :type, :string, null: false
      add :address, :integer, null: false

      timestamps()
    end
  end
end
