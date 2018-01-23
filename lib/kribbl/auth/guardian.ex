defmodule Kribbl.Auth.Guardian do
  use Guardian, otp_app: :kribbl

  alias Kribbl.Auth

  def subject_for_token(user, _claims) do
    sub = to_string(user.id)
    {:ok, sub}
  end
  def subject_for_token(_, _) do
    {:error, :reason_for_error}
  end

  def resource_from_claims(claims) do
    user = claims["sub"]
    |> Auth.get_user!
    {:ok, user}
  end
  def resource_from_claims(_claims) do
    {:error, :reason_for_error}
  end
end