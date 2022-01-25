defmodule DriftDelivery.Repo do
  use Ecto.Repo,
    otp_app: :drift_delivery,
    adapter: Ecto.Adapters.Postgres
end
