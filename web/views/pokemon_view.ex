defmodule Byzal.PokemonView do
  use Byzal.Web, :view

  def render("show.json", %{data: request_data}) do
    request_data
  end
end
