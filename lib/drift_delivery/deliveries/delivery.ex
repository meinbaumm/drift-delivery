defmodule DriftDelivery.Deliveries.Delivery do
  use Ecto.Schema

  import Ecto.Changeset

  schema "deliveries" do
    field :cost, :integer, null: false
    field :rate, :integer, null: false
    field :duration, :integer

    timestamps()
  end

  def changeset(delivery, attrs \\ %{}) do
    delivery
    |> cast(attrs, [
      :cost,
      :rate,
      :duration
    ])
    |> validate_required([
      :cost,
      :rate,
      :duration
    ])
    |> validate_number(:cost, greater_than: 0)
    |> validate_number(:rate, greater_than: 0)
    |> validate_number(:duration, greater_than: 0)
  end
end
