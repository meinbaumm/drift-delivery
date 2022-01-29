defmodule DriftDelivery.Repo.Migrations.CreateCouriers do
  use Ecto.Migration

  def change do
    create table("couriers") do
      add :first_name, :string
      add :last_name, :string
      add :additional_name, :string

      add :phone, :string, null: false
      add :email, :string, null: false
      add :transportation_type, :string, null: false

      add :password_hash, :string, null: false

      timestamps()
    end
  end
end
