defmodule GitEctoSandbox.PageController do
  use GitEctoSandbox.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
