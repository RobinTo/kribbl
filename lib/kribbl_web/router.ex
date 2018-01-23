defmodule KribblWeb.Router do
  use KribblWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", KribblWeb do
    pipe_through :api
    
    post "/login", SessionController, :login

    resources "/users", UserController, except: [:new, :edit]
  end
end
