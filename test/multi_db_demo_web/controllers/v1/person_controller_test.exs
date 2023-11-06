defmodule MultiDbDemoWeb.V1.PersonControllerTest do
  use MultiDbDemoWeb.ConnCase

  import MultiDbDemo.V1.PersonsFixtures

  alias MultiDbDemo.V1.Persons.Person

  @create_attrs %{
    age: 42,
    name: "some name"
  }
  @update_attrs %{
    age: 43,
    name: "some updated name"
  }
  @invalid_attrs %{age: nil, name: nil}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all persons", %{conn: conn} do
      conn = get(conn, Routes.v1_person_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create person" do
    test "renders person when data is valid", %{conn: conn} do
      conn = post(conn, Routes.v1_person_path(conn, :create), person: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.v1_person_path(conn, :show, id))

      assert %{
               "id" => ^id,
               "age" => 42,
               "name" => "some name"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.v1_person_path(conn, :create), person: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update person" do
    setup [:create_person]

    test "renders person when data is valid", %{conn: conn, person: %Person{id: id} = person} do
      conn = put(conn, Routes.v1_person_path(conn, :update, person), person: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.v1_person_path(conn, :show, id))

      assert %{
               "id" => ^id,
               "age" => 43,
               "name" => "some updated name"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, person: person} do
      conn = put(conn, Routes.v1_person_path(conn, :update, person), person: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete person" do
    setup [:create_person]

    test "deletes chosen person", %{conn: conn, person: person} do
      conn = delete(conn, Routes.v1_person_path(conn, :delete, person))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.v1_person_path(conn, :show, person))
      end
    end
  end

  defp create_person(_) do
    person = person_fixture()
    %{person: person}
  end
end
