defmodule DriftDelivery.Couriers.Courier do
  use Ecto.Schema

  import Ecto.Changeset
  import Bcrypt, only: [hash_pwd_salt: 1]

  schema "couriers" do
    field :first_name, :string
    field :last_name, :string
    field :additional_name, :string

    field :phone, :string, null: false
    field :email, :string, null: false
    field :transportation_type, :string, null: false

    field :password_hash, :string, null: false
    field :password, :string, virtual: true

    timestamps()
  end

  def changeset(courier, attrs \\ %{}) do
    courier
    |> cast(attrs, [
      :first_name,
      :last_name,
      :additional_name,
      :phone,
      :email,
      :transportation_type,
      :password
    ])
    |> validate_required([
      :first_name,
      :last_name,
      :additional_name,
      :email,
      :phone,
      :transportation_type
    ])
    |> validate_inclusion(:transportation_type, ["car", "feet", "bicycle", "scooter", "other"])
    |> unique_constraint([:email, :phone], message: "Has already been taken")
    |> validate_format(:email, ~r/@/, message: "Wrong email format")
    |> validate_format(:password, ~r/((?!.*[\s])(?=.*[A-Za-z\d@$!%*#?&]).{8,})/,
      message: "Password must be longer than 7 symbols"
    )
    |> put_password_hash()
    |> validate_required([:password_hash])
  end

  defp put_password_hash(
         %Ecto.Changeset{valid?: true, changes: %{password: password}} = changeset
       ) do
    changeset
    |> put_change(:password_hash, hash_pwd_salt(password))
    |> put_change(:password, nil)
  end

  defp put_password_hash(changeset), do: changeset
end
