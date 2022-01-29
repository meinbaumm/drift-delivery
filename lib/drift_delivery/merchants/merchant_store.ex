defmodule DriftDelivery.Merchants.MerchantStore do
  use Ecto.Schema

  import Ecto.Changeset

  alias DriftDelivery.Merchants.Merchant
  alias DriftDelivery.Stores.Store

  schema "merchant_store" do
    belongs_to :store, Store
    belongs_to :merchant, Merchant

    field :first_name, :string
    field :last_name, :string
    field :additional_name, :string

    field :phone, :string, null: false
    field :email, :string, null: false

    field :name, :string, null: false
    field :type, :string, null: false
    field :address, :integer, null: false

    timestamps()
  end

  def changeset(store, attrs \\ %{}) do
    store
    |> cast(attrs, [
      :first_name,
      :last_name,
      :additional_name,
      :phone,
      :email,
      :name,
      :type,
      :address
    ])
    |> validate_required([
      :first_name,
      :last_name,
      :additional_name,
      :phone,
      :email,
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
