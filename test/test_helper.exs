ExUnit.start

Mix.Task.run "ecto.create", ~w(-r GitEctoSandbox.Repo --quiet)
Mix.Task.run "ecto.migrate", ~w(-r GitEctoSandbox.Repo --quiet)
Ecto.Adapters.SQL.begin_test_transaction(GitEctoSandbox.Repo)

