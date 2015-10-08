defmodule Byzal.PokemonControllerTest do
  use Byzal.ConnCase

  test "returns correct JSON for GET request to '/'" do
    conn = get(conn(), "/") |> verify_connection
    verify_json(
      conn.resp_body,
      build_params(%{"method" => "GET", "path" => "/"})
    )
  end

  test "returns correct JSON for GET request to '/search?query=value'" do
    conn = get(conn(), "/search?query=value") |> verify_connection
    verify_json(
      conn.resp_body,
      build_params(%{"method" => "GET", "path" => "/search", "query_params" => %{ "query" => "value" }})
    )
  end

  test "returns correct JSON for GET request with headers" do
    conn = get(conn() |> put_req_header("accept", "application/json"), "/") |> verify_connection
    verify_json(
      conn.resp_body,
      build_params(%{"method" => "GET", "path" => "/", "headers" => %{ "accept" => "application/json"}})
    )
  end

  test "returns correct JSON for POST request to '/create'" do
    conn = post(conn(), "/create") |> verify_connection
    verify_json(
      conn.resp_body,
      build_params(%{"method" => "POST", "path" => "/create"})
    )
  end

  test "returns correct JSON for POST request to '/create' with parameters" do
    conn = post(conn(), "/create", name: "new") |> verify_connection
    verify_json(
      conn.resp_body,
      build_params(%{"method" => "POST", "path" => "/create", "body_params" => %{ "name" => "new" }, "headers" => %{"content-type" => "multipart/mixed; charset: utf-8"}})
    )
  end

  test "returns correct JSON for PUT request to '/'" do
    conn = put(conn(), "/") |> verify_connection
    verify_json(
      conn.resp_body,
      build_params(%{"method" => "PUT", "path" => "/"})
    )
  end

  test "returns correct JSON for PATCH request to '/'" do
    conn = patch(conn(), "/") |> verify_connection
    verify_json(
      conn.resp_body,
      build_params(%{"method" => "PATCH", "path" => "/"})
    )
  end

  test "returns correct JSON for DELETE request to '/'" do
    conn = delete(conn(), "/") |> verify_connection
    verify_json(
      conn.resp_body,
      build_params(%{"method" => "DELETE", "path" => "/"})
    )
  end

  test "returns correct JSON for OPTIONS request to '/'" do
    conn = options(conn(), "/") |> verify_connection
    verify_json(
      conn.resp_body,
      build_params(%{"method" => "OPTIONS", "path" => "/"})
    )
  end

  test "returns correct JSON for CONNECT request to '/'" do
    conn = connect(conn(), "/") |> verify_connection
    verify_json(
      conn.resp_body,
      build_params(%{"method" => "CONNECT", "path" => "/"})
    )
  end

  test "returns correct JSON for TRACE request to '/'" do
    conn = trace(conn(), "/") |> verify_connection
    verify_json(
      conn.resp_body,
      build_params(%{"method" => "TRACE", "path" => "/"})
    )
  end

  defp verify_connection(conn) do
    assert conn.state == :sent
    assert conn.status == 200

    conn
  end

  def verify_json(json, expected) do
    assert Poison.Parser.parse!(json) == expected
  end

  def base_params do
    %{
      "scheme" => "http",
      "host" => "www.example.com",
      "query_params" => %{},
      "body_params" => %{},
      "headers" => %{},
    }
  end

  def build_params(params) do
    Dict.merge(base_params, params)
  end
end
