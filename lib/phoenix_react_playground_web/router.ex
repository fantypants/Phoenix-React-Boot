defmodule PhoenixReactPlaygroundWeb.Router do
  use PhoenixReactPlaygroundWeb, :router

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

  scope "/", PhoenixReactPlaygroundWeb do
    pipe_through :browser # Use the default browser stack

    get "/*path", PageController, :index
  end

  # Other scopes may use custom stacks.
   scope "/api", PhoenixReactPlaygroundWeb do
     pipe_through :api
     resources "/languages", LanguageController, except: [:new, :edit]
     get "/languages/1", LanguageController, :show_1

   end
end
