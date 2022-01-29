defmodule DriftDelivery.Orders.Order do
  use Ecto.Schema

  import Ecto.Changeset

  schema "orders" do
    field :paycheck, :map
    field :payment_status, :string

    timestamps()
  end

  def changeset(order, attrs \\ %{}) do
    order
    |> cast(attrs, [
      :paycheck,
      :payment_status
    ])
    |> validate_required([
      :paycheck,
      :payment_status
    ])
    |> validate_inclusion(:payment_status, ["pending", "canceled", "successful"])
  end
end
