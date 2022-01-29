defmodule DriftDelivery.Repo.Migrations.CreateReviews do
  use Ecto.Migration

  def change do
    create table("reviews") do
      add :review_text, :string, null: false
      add :status, :string, null: false

      timestamps()
    end
  end
end
