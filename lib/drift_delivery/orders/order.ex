defmodule DriftDelivery.Orders.Order do
  use Ecto.Schema

  import Ecto.Changeset

  alias DriftDelivery.Customers.Customer
  alias DriftDelivery.Deliveries.Delivery

  schema "orders" do
    belongs_to :customer, Customer
    has_one :delivery, Delivery

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
