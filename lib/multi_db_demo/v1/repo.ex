defmodule MultiDbDemo.Repo.V1 do
  use Ecto.Repo,
    otp_app: :multi_db_demo,
    adapter: Ecto.Adapters.Postgres
end
