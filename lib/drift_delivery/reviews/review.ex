defmodule DriftDelivery.Reviews.Review do
  use Ecto.Schema

  import Ecto.Changeset

  alias DriftDelivery.Customers.Customer
  alias DriftDelivery.Products.Product

  schema "reviews" do
    belongs_to :customer, Customer
    belongs_to :product, Product

    field :review_text, :string, null: false
    field :status, :string, null: false

    timestamps()
  end

  def changeset(product, attrs \\ %{}) do
    product
    |> cast(attrs, [
      :review_text,
      :status
    ])
    |> validate_required([
      :review_text,
      :status
    ])
    |> validate_inclusion(:status, ["sended", "updated", "deleted"])
  end
end
