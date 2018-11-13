defmodule DockupDemoWeb.PageController do
  use DockupDemoWeb, :controller

  import DockupDemoWeb.Router.Helpers

  def index(conn, _params) do
    redirect conn, to: product_path(conn, :index)
  end
end
