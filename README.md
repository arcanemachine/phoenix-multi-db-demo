# multi-db-demo

A proof-of-concept implementation of a multi-database Phoenix application.

The required steps can be found in the [commits](https://github.com/arcanemachine/phoenix-multi-db-demo/commits/main) for this repo. Each step is documented and can be used as a template for implementing multiple databases/repos in your Phoneix project.

Made with the help of the tutorial in [this Medium post](https://medium.com/podiihq/connect-two-databases-using-ecto-1861116fbea2) (archived link [here](https://archive.ph/x2TyR)).

## Getting Started

To make it easy to set up multiple Postgres instances, follow the instructions below (Must have Docker installed).

To start your Phoenix server:

  * Install dependencies with `mix deps.get`
  * Start your Postgres Docker containers using the script `support/scripts/start-postgres-containers`.
  * Create and migrate your database with `mix ecto.setup`
  * Start Phoenix endpoint with `mix phx.server` or inside IEx with `iex -S mix phx.server`
  * For a quick demo, run the script `support/scripts/demo`.
    - It should print information about 3 objects from each database (for a total of 6).

