defmodule GitEctoSandbox.CommitControllerTest do
  use GitEctoSandbox.ConnCase

  alias GitEctoSandbox.Commit
  @valid_attrs %{}
  @invalid_attrs %{}

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, commit_path(conn, :index)
    assert html_response(conn, 200) =~ "Listing commits"
  end

  test "renders form for new resources", %{conn: conn} do
    conn = get conn, commit_path(conn, :new)
    assert html_response(conn, 200) =~ "New commit"
  end

  test "creates resource and redirects when data is valid", %{conn: conn} do
    conn = post conn, commit_path(conn, :create), commit: @valid_attrs
    assert redirected_to(conn) == commit_path(conn, :index)
    assert Repo.get_by(Commit, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, commit_path(conn, :create), commit: @invalid_attrs
    assert html_response(conn, 200) =~ "New commit"
  end

  test "shows chosen resource", %{conn: conn} do
    commit = Repo.insert! %Commit{}
    conn = get conn, commit_path(conn, :show, commit)
    assert html_response(conn, 200) =~ "Show commit"
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, commit_path(conn, :show, -1)
    end
  end

  test "renders form for editing chosen resource", %{conn: conn} do
    commit = Repo.insert! %Commit{}
    conn = get conn, commit_path(conn, :edit, commit)
    assert html_response(conn, 200) =~ "Edit commit"
  end

  test "updates chosen resource and redirects when data is valid", %{conn: conn} do
    commit = Repo.insert! %Commit{}
    conn = put conn, commit_path(conn, :update, commit), commit: @valid_attrs
    assert redirected_to(conn) == commit_path(conn, :show, commit)
    assert Repo.get_by(Commit, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    commit = Repo.insert! %Commit{}
    conn = put conn, commit_path(conn, :update, commit), commit: @invalid_attrs
    assert html_response(conn, 200) =~ "Edit commit"
  end

  test "deletes chosen resource", %{conn: conn} do
    commit = Repo.insert! %Commit{}
    conn = delete conn, commit_path(conn, :delete, commit)
    assert redirected_to(conn) == commit_path(conn, :index)
    refute Repo.get(Commit, commit.id)
  end
end
