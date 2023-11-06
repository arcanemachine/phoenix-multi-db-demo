defmodule MultiDbDemoWeb.V2.PersonView do
  use MultiDbDemoWeb, :view
  alias MultiDbDemoWeb.V2.PersonView

  def render("index.json", %{persons: persons}) do
    %{data: render_many(persons, PersonView, "person.json")}
  end

  def render("show.json", %{person: person}) do
    %{data: render_one(person, PersonView, "person.json")}
  end

  def render("person.json", %{person: person}) do
    %{
      id: person.id,
      first_name: person.first_name,
      last_name: person.last_name,
      age: person.age
    }
  end
end
