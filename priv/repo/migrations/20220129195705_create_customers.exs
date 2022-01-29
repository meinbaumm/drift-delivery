defmodule DriftDelivery.Repo.Migrations.CreateCustomers do
  use Ecto.Migration

  def change do
    create table("customers") do
      add :first_name, :string
      add :last_name, :string
      add :additional_name, :string

      add :phone, :string, null: false
      add :email, :string, null: false
      add :home_address, :string

      add :password_hash, :string, null: false

      timestamps()
    end
  end
end
