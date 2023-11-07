import Config

# Configure your database
#
# The MIX_TEST_PARTITION environment variable can be used
# to provide built-in test partitioning in CI environment.
# Run `mix help test` for more information.
config :multi_db_demo, MultiDbDemo.Repo.V1,
  username: "postgres",
  password: "postgres",
  hostname: "localhost",
  port: 5432,
  database: "multi_db_demo_v1_test#{System.get_env("MIX_TEST_PARTITION")}",
  pool: Ecto.Adapters.SQL.Sandbox,
  pool_size: 10

config :multi_db_demo, MultiDbDemo.Repo.V2,
  username: "postgres",
  password: "postgres",
  hostname: "localhost",
  port: 5433,
  database: "multi_db_demo_v2_test#{System.get_env("MIX_TEST_PARTITION")}",
  pool: Ecto.Adapters.SQL.Sandbox,
  pool_size: 10

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :multi_db_demo, MultiDbDemoWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4002],
  secret_key_base: "lsE+QKsghVFVxpkZozFAqCWMWjQZrvtYxlmyktAbGu1ThD859hj8FYfvCqNHwkIW",
  server: false

# In test we don't send emails.
config :multi_db_demo, MultiDbDemo.Mailer, adapter: Swoosh.Adapters.Test

# Print only warnings and errors during test
config :logger, level: :warn

# Initialize plugs at runtime for faster test compilation
config :phoenix, :plug_init_mode, :runtime
