defmodule Kribbl.Auth.User do
  use Ecto.Schema
  import Ecto.Changeset
  alias Kribbl.Auth.User


  schema "users" do
    field :email, :string
    field :is_admin, :boolean, default: false
    field :name, :string
    field :password_hash, :string
    field :password, :string, virtual: true

    timestamps()
  end

  @doc false
  def changeset(%User{} = user, attrs) do
    user
    |> cast(attrs, [:email, :name, :password, :is_admin])
    |> validate_required([:email, :name, :password, :is_admin])
    |> unique_constraint(:username)
    |> validate_length(:password, min: 5, max: 49)
    |> validate_length(:name, min: 3, max: 25)
    |> put_pass_hash()
    |> validate_required([:password_hash])
  end

  defp put_pass_hash(%Ecto.Changeset{valid?: true, changes: %{password: password}} = changeset) do
    change(changeset, password_hash: Comeonin.Argon2.hashpwsalt(password))
  end
  defp put_pash_hash(changeset), do: changeset
end
