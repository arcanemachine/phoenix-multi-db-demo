defmodule MultiDbDemo.Repo.V2 do
  use Ecto.Repo,
    otp_app: :multi_db_demo,
    adapter: Ecto.Adapters.Postgres
end
