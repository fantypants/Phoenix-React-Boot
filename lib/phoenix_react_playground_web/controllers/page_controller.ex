defmodule PhoenixReactPlaygroundWeb.PageController do
  use PhoenixReactPlaygroundWeb, :controller

  def index(conn, _params) do
    IO.puts "Running"
    PhoenixReactPlayground.Repo.all(PhoenixReactPlayground.Example.Language) |> IO.inspect
    render conn, "index.html"
  end
end
