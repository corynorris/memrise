defmodule Memrise.CoursesTest do
  use Memrise.DataCase

  alias Memrise.Courses

  describe "courses" do
    alias Memrise.Courses.Course

    @valid_attrs %{description: "some description", name: "some name"}
    @update_attrs %{description: "some updated description", name: "some updated name"}
    @invalid_attrs %{description: nil, name: nil}

    def course_fixture(attrs \\ %{}) do
      {:ok, course} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Courses.create_course()

      course
    end

    test "list_courses/0 returns all courses" do
      course = course_fixture()
      assert Courses.list_courses() == [course]
    end

    test "get_course!/1 returns the course with given id" do
      course = course_fixture()
      assert Courses.get_course!(course.id) == course
    end

    test "create_course/1 with valid data creates a course" do
      assert {:ok, %Course{} = course} = Courses.create_course(@valid_attrs)
      assert course.description == "some description"
      assert course.name == "some name"
    end

    test "create_course/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Courses.create_course(@invalid_attrs)
    end

    test "update_course/2 with valid data updates the course" do
      course = course_fixture()
      assert {:ok, %Course{} = course} = Courses.update_course(course, @update_attrs)
      assert course.description == "some updated description"
      assert course.name == "some updated name"
    end

    test "update_course/2 with invalid data returns error changeset" do
      course = course_fixture()
      assert {:error, %Ecto.Changeset{}} = Courses.update_course(course, @invalid_attrs)
      assert course == Courses.get_course!(course.id)
    end

    test "delete_course/1 deletes the course" do
      course = course_fixture()
      assert {:ok, %Course{}} = Courses.delete_course(course)
      assert_raise Ecto.NoResultsError, fn -> Courses.get_course!(course.id) end
    end

    test "change_course/1 returns a course changeset" do
      course = course_fixture()
      assert %Ecto.Changeset{} = Courses.change_course(course)
    end
  end

  describe "card" do
    alias Memrise.Courses.Card

    @valid_attrs %{back: "some back", front: "some front", hint: "some hint", image: "some image"}
    @update_attrs %{back: "some updated back", front: "some updated front", hint: "some updated hint", image: "some updated image"}
    @invalid_attrs %{back: nil, front: nil, hint: nil, image: nil}

    def card_fixture(attrs \\ %{}) do
      {:ok, card} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Courses.create_card()

      card
    end

    test "list_card/0 returns all card" do
      card = card_fixture()
      assert Courses.list_card() == [card]
    end

    test "get_card!/1 returns the card with given id" do
      card = card_fixture()
      assert Courses.get_card!(card.id) == card
    end

    test "create_card/1 with valid data creates a card" do
      assert {:ok, %Card{} = card} = Courses.create_card(@valid_attrs)
      assert card.back == "some back"
      assert card.front == "some front"
      assert card.hint == "some hint"
      assert card.image == "some image"
    end

    test "create_card/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Courses.create_card(@invalid_attrs)
    end

    test "update_card/2 with valid data updates the card" do
      card = card_fixture()
      assert {:ok, %Card{} = card} = Courses.update_card(card, @update_attrs)
      assert card.back == "some updated back"
      assert card.front == "some updated front"
      assert card.hint == "some updated hint"
      assert card.image == "some updated image"
    end

    test "update_card/2 with invalid data returns error changeset" do
      card = card_fixture()
      assert {:error, %Ecto.Changeset{}} = Courses.update_card(card, @invalid_attrs)
      assert card == Courses.get_card!(card.id)
    end

    test "delete_card/1 deletes the card" do
      card = card_fixture()
      assert {:ok, %Card{}} = Courses.delete_card(card)
      assert_raise Ecto.NoResultsError, fn -> Courses.get_card!(card.id) end
    end

    test "change_card/1 returns a card changeset" do
      card = card_fixture()
      assert %Ecto.Changeset{} = Courses.change_card(card)
    end
  end
end
