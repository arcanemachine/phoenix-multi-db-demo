defmodule MultiDbDemo.V2.Persons.Person do
  use Ecto.Schema
  import Ecto.Changeset

  schema "persons" do
    field :age, :integer
    field :first_name, :string
    field :last_name, :string

    timestamps()
  end

  @doc false
  def changeset(person, attrs) do
    person
    |> cast(attrs, [:first_name, :last_name, :age])
    |> validate_required([:first_name, :last_name, :age])
  end
end
