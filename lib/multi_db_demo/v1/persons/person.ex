defmodule MultiDbDemo.V1.Persons.Person do
  use Ecto.Schema
  import Ecto.Changeset

  schema "persons" do
    field :age, :integer
    field :name, :string

    timestamps()
  end

  @doc false
  def changeset(person, attrs) do
    person
    |> cast(attrs, [:name, :age])
    |> validate_required([:name, :age])
  end
end
