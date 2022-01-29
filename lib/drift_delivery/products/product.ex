defmodule DriftDelivery.Products.Product do
  use Ecto.Schema

  import Ecto.Changeset

  alias DriftDelivery.Stores.Store
  alias DriftDelivery.Reviews.Review

  schema "products" do
    belongs_to :store, Store
    has_many :review, Review

    field :full_name, :string, null: false
    field :brand, :string, null: false
    field :model, :string, null: false
    field :description, :string, null: false

    field :amount, :integer, null: false
    field :mass, :integer, null: false
    field :volume, :integer, null: false

    field :code, :string, null: false

    timestamps()
  end

  def changeset(product, attrs \\ %{}) do
    product
    |> cast(attrs, [
      :full_name,
      :brand,
      :model,
      :description,
      :amount,
      :mass,
      :volume,
      :code
    ])
    |> validate_required([
      :full_name,
      :brand,
      :model,
      :description,
      :amount,
      :mass,
      :volume,
      :code
    ])
    |> validate_number(:mass, greater_than_or_equal_to: 0)
    |> validate_number(:volume, greater_than_or_equal_to: 0)
    |> validate_number(:amount, greater_than: 0)
  end
end
