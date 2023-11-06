defmodule MultiDbDemo.Repo.Migrations.CreatePersons do
  use Ecto.Migration

  def change do
    create table(:persons) do
      add :first_name, :string
      add :last_name, :string
      add :age, :integer

      timestamps()
    end
  end
end
