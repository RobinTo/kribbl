defmodule Kribbl.Auth.AuthenticateUser do
  alias Kribbl.Repo
  alias Kribbl.Auth.User
  alias Kribbl.Auth.Guardian

  def authenticate_user(name, plain_text_password) do
    Repo.get_by(User, name: name)
    |> check_password(plain_text_password)
  end

  defp check_password(nil, _), do: {:error, "Incorrect username or password"}

  defp check_password(user, plain_text_password) do
    Comeonin.Argon2.checkpw(plain_text_password, user.password_hash)
    |> return_authentication(user)
  end

  def return_authentication(true, user), do: Guardian.encode_and_sign(user)
  def return_authentication(false, _), do: {:error, :unauthorized}
end