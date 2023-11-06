defmodule MultiDbDemo.Repo do
  use Ecto.Repo,
    otp_app: :multi_db_demo,
    adapter: Ecto.Adapters.Postgres
end
