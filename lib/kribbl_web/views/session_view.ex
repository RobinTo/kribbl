defmodule KribblWeb.SessionView do
  use KribblWeb, :view
  alias KribblWeb.SessionView

  def render("show.json", %{session: session}) do
    %{data: render_one(session, SessionView, "session.json")}
  end

  def render("session.json", %{session: session}) do
    %{token: session.token, id: session.id}
  end
end