alias MultiDbDemo.{V1, V2}

# create v1 persons
v1_persons = [
  %{
    name: "Alice Anderson",
    age: 1
  },
  %{
    name: "Bob Barker",
    age: 2
  },
  %{
    name: "Carol Carter",
    age: 3
  }
]

Enum.each(v1_persons, fn person -> V1.Persons.create_person(person) end)

# create v2 persons
v2_persons = [
  %{
    first_name: "Alice",
    last_name: "Anderson",
    age: 1
  },
  %{
    first_name: "Bob",
    last_name: "Barker",
    age: 2
  },
  %{
    first_name: "Carol",
    last_name: "Carter",
    age: 3
  }
]

Enum.each(v2_persons, fn person -> V2.Persons.create_person(person) end)
