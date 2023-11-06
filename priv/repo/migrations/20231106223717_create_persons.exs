defmodule MultiDbDemo.Repo.Migrations.CreatePersons do
  use Ecto.Migration

  def change do
    create table(:persons) do
      add :name, :string
      add :age, :integer

      timestamps()
    end
  end
end
