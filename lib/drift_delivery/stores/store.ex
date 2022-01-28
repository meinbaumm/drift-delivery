defmodule DriftDelivery.Stores.Store do
  use Ecto.Schema

  import Ecto.Changeset

  schema "stores" do
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
