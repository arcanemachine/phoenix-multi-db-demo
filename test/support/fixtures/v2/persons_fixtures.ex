defmodule MultiDbDemo.V2.PersonsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `MultiDbDemo.V2.Persons` context.
  """

  @doc """
  Generate a person.
  """
  def person_fixture(attrs \\ %{}) do
    {:ok, person} =
      attrs
      |> Enum.into(%{
        age: 42,
        first_name: "some first_name",
        last_name: "some last_name"
      })
      |> MultiDbDemo.V2.Persons.create_person()

    person
  end
end
