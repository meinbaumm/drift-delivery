defmodule DriftDelivery.Deliveries.Rate do
  use Ecto.Schema

  import Ecto.Changeset

  schema "rates" do
    field :season, :string, null: false
    field :weather, :string, null: false
    field :temperature, :integer, null: false
    field :daypart, :string, null: false

    field :distance, :integer, null: false
    field :workload, :integer, default: 0

    field :mass, :integer, null: false
    field :volume, :integer, null: false
    field :shipping_amount, :integer, null: false

    timestamps()
  end

  def changeset(rate, attrs \\ %{}) do
    rate
    |> cast(attrs, [
      :season,
      :weather,
      :temperature,
      :daypart,
      :distance,
      :workload,
      :mass,
      :volume,
      :shipping_amount
    ])
    |> validate_required([
      :season,
      :weather,
      :temperature,
      :daypart,
      :distance,
      :workload,
      :mass,
      :volume,
      :shipping_amount
    ])
    |> validate_inclusion(:season, ["winter", "spring", "summer", "autumn"])
    |> validate_inclusion(:weather, ["rain", "snow", "sun", "cloud", "other"])
    |> validate_number(:temperature, greater_than_or_equal_to: -20, less_than: 50)
    |> validate_inclusion(:daypart, ["morning", "noon", "afternoon"])
    |> validate_number(:distance, greater_than_or_equal_to: 0)
    |> validate_number(:workload, greater_than_or_equal_to: 0, less_than: 100)
    |> validate_number(:mass, greater_than_or_equal_to: 0)
    |> validate_number(:volume, greater_than_or_equal_to: 0)
    |> validate_number(:shipping_amount, greater_than: 0)
  end
end
