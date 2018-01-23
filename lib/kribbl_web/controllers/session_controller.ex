defmodule KribblWeb.SessionController do
  use KribblWeb, :controller

  alias Kribbl.Auth.AuthenticateUser

  def login(conn, %{"user" => %{"name" => name, "password" => password}}) do
    with {:ok, jwt, resource} <- AuthenticateUser.authenticate_user(name, password) do
      conn
      |> put_status(:created)
      |> render("show.json", %{session: %{token: jwt, id: resource["sub"]}})
    end
  end
end