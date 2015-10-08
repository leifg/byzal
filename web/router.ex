defmodule Byzal.Router do
  use Byzal.Web, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", Byzal do
    pipe_through :api

    get "/*path", PokemonController, :catch_all
    post "/*path", PokemonController, :catch_all
    put "/*path", PokemonController, :catch_all
    patch "/*path", PokemonController, :catch_all
    delete "/*path", PokemonController, :catch_all
    options "/*path", PokemonController, :catch_all
    connect "/*path", PokemonController, :catch_all
    trace "/*path", PokemonController, :catch_all
  end
end
