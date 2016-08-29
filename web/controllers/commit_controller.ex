defmodule GitEctoSandbox.CommitController do
  use GitEctoSandbox.Web, :controller

  alias GitEcto.Commit

  def index(conn, _params) do
    commits = Repo.all(Commit)
    render(conn, "index.html", commits: commits)
  end

  def show(conn, %{"id" => id}) do
    commit = Repo.get!(Commit, id)
    render(conn, "show.html", commit: commit)
  end

end
