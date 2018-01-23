defmodule Kribbl.Auth.Pipeline do
  use Guardian.Plug.Pipeline,
    otp_app: :kribbl,
    error_handler: Kribbl.Auth.ErrorHandler,
    module: Kribbl.Auth.Guardian

  plug Guardian.Plug.VerifyHeader, claims: %{"typ" => "access"}, realm: "Bearer"
  plug Guardian.Plug.EnsureAuthenticated
  plug Guardian.Plug.LoadResource, ensure: true
end