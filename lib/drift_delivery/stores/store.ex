defmodule DriftDelivery.Stores.Store do
  use Ecto.Schema

  import Ecto.Changeset

  alias DriftDelivery.Merchants.Merchant
  alias DriftDelivery.Products.Product

  schema "stores" do
    has_many :merchant, Merchant
    has_many :product, Product

    field :name, :string, null: false
    field :type, :string, null: false
    field :address, :integer, null: false

    timestamps()
  end

  def changeset(store, attrs \\ %{}) do
    store
    |> cast(attrs, [
      :name,
      :type,
      :address
    ])
    |> validate_required([
      :name,
      :type,
      :address
    ])
    |> validate_inclusion(:type, [
      "sport",
      "market",
      "book",
      "bakery",
      "toy",
      "pharm",
      "shoe",
      "clothing"
    ])
  end
end
