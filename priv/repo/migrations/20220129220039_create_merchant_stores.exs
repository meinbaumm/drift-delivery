defmodule DriftDelivery.Repo.Migrations.CreateMerchantStores do
  use Ecto.Migration

  def change do
    create table("merchant_store") do
      add :merchant_id, references(:merchants)
      add :store_id, references(:stores)

      add :first_name, :string
      add :last_name, :string
      add :additional_name, :string

      add :phone, :string, null: false
      add :email, :string, null: false

      add :name, :string, null: false
      add :type, :string, null: false
      add :address, :integer, null: false

      timestamps()
    end
  end
end
