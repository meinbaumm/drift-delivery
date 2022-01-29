defmodule DriftDelivery.Customers.CustomerCard do
  use Ecto.Schema

  import Ecto.Changeset

  schema "reviews" do
    field :number, :string, null: false
    field :valid_date, :date, null: false

    timestamps()
  end

  def changeset(product, attrs \\ %{}) do
    product
    |> cast(attrs, [
      :number,
      :valid_date
    ])
    |> validate_required([
      :number,
      :valid_date
    ])
    |> unique_constraint([:number])
    |> validate_format(:number, ~r/[*0-9]/, message: "The card number should contain only numbers")
  end
end
