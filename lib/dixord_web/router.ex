defmodule DixordWeb.Router do
  use DixordWeb, :router
  use Pow.Phoenix.Router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/" do
    pipe_through :browser

    pow_routes()
  end

  scope "/", DixordWeb do
    pipe_through :browser

    resources "/users", UserController
    resources "/messages", MessageController
    resources "/", PageController
  end

  # Other scopes may use custom stacks.
  # scope "/api", DixordWeb do
  #   pipe_through :api
  # end
end
