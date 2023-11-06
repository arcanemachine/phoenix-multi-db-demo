defmodule MultiDbDemo.V1.PersonsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `MultiDbDemo.V1.Persons` context.
  """

  @doc """
  Generate a person.
  """
  def person_fixture(attrs \\ %{}) do
    {:ok, person} =
      attrs
      |> Enum.into(%{
        age: 42,
        name: "some name"
      })
      |> MultiDbDemo.V1.Persons.create_person()

    person
  end
end
