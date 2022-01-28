defmodule DriftDelivery.Orders.Order do
  use Ecto.Schema

  import Ecto.Changeset

  schema "orders" do
    field :paycheck, :map

    timestamps()
  end

  def changeset(order, attrs \\ %{}) do
    order
    |> cast(attrs, [
      :paycheck
    ])
    |> validate_required([
      :paycheck
    ])
  end
end
