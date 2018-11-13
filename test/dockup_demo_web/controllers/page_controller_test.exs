defmodule DockupDemoWeb.PageControllerTest do
  use DockupDemoWeb.ConnCase

  test "GET /", %{conn: conn} do
    conn = get(conn, "/")
    assert redirected_to(conn) =~ "/products"
  end
end
