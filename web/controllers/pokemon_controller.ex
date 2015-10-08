defmodule Byzal.PokemonController do
  use Byzal.Web, :controller

  def catch_all(conn, _params) do
    data = %{
      scheme: conn.scheme,
      host: conn.host,
      method: conn.method,
      path: "/#{Enum.join(conn.params["path"], "/")}",
      query_params: conn.query_params,
      body_params: conn.body_params,
      headers: Enum.into(conn.req_headers, %{}),
    }
    render conn, "show.json", %{data: data}
  end
end
