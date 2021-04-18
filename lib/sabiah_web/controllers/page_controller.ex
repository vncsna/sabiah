defmodule SabiahWeb.PageController do
  use SabiahWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
