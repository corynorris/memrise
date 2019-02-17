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

  describe "user_courses" do
    alias Memrise.Courses.UserCourses

    @valid_attrs %{}
    @update_attrs %{}
    @invalid_attrs %{}

    def user_courses_fixture(attrs \\ %{}) do
      {:ok, user_courses} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Courses.create_user_courses()

      user_courses
    end

    test "list_user_courses/0 returns all user_courses" do
      user_courses = user_courses_fixture()
      assert Courses.list_user_courses() == [user_courses]
    end

    test "get_user_courses!/1 returns the user_courses with given id" do
      user_courses = user_courses_fixture()
      assert Courses.get_user_courses!(user_courses.id) == user_courses
    end

    test "create_user_courses/1 with valid data creates a user_courses" do
      assert {:ok, %UserCourses{} = user_courses} = Courses.create_user_courses(@valid_attrs)
    end

    test "create_user_courses/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Courses.create_user_courses(@invalid_attrs)
    end

    test "update_user_courses/2 with valid data updates the user_courses" do
      user_courses = user_courses_fixture()
      assert {:ok, %UserCourses{} = user_courses} = Courses.update_user_courses(user_courses, @update_attrs)
    end

    test "update_user_courses/2 with invalid data returns error changeset" do
      user_courses = user_courses_fixture()
      assert {:error, %Ecto.Changeset{}} = Courses.update_user_courses(user_courses, @invalid_attrs)
      assert user_courses == Courses.get_user_courses!(user_courses.id)
    end

    test "delete_user_courses/1 deletes the user_courses" do
      user_courses = user_courses_fixture()
      assert {:ok, %UserCourses{}} = Courses.delete_user_courses(user_courses)
      assert_raise Ecto.NoResultsError, fn -> Courses.get_user_courses!(user_courses.id) end
    end

    test "change_user_courses/1 returns a user_courses changeset" do
      user_courses = user_courses_fixture()
      assert %Ecto.Changeset{} = Courses.change_user_courses(user_courses)
    end
  end

  describe "course_activity" do
    alias Memrise.Courses.CourseActivity

    @valid_attrs %{last_studied: ~N[2010-04-17 14:00:00], retries: 42, strength: 42}
    @update_attrs %{last_studied: ~N[2011-05-18 15:01:01], retries: 43, strength: 43}
    @invalid_attrs %{last_studied: nil, retries: nil, strength: nil}

    def course_activity_fixture(attrs \\ %{}) do
      {:ok, course_activity} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Courses.create_course_activity()

      course_activity
    end

    test "list_course_activity/0 returns all course_activity" do
      course_activity = course_activity_fixture()
      assert Courses.list_course_activity() == [course_activity]
    end

    test "get_course_activity!/1 returns the course_activity with given id" do
      course_activity = course_activity_fixture()
      assert Courses.get_course_activity!(course_activity.id) == course_activity
    end

    test "create_course_activity/1 with valid data creates a course_activity" do
      assert {:ok, %CourseActivity{} = course_activity} = Courses.create_course_activity(@valid_attrs)
      assert course_activity.last_studied == ~N[2010-04-17 14:00:00]
      assert course_activity.retries == 42
      assert course_activity.strength == 42
    end

    test "create_course_activity/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Courses.create_course_activity(@invalid_attrs)
    end

    test "update_course_activity/2 with valid data updates the course_activity" do
      course_activity = course_activity_fixture()
      assert {:ok, %CourseActivity{} = course_activity} = Courses.update_course_activity(course_activity, @update_attrs)
      assert course_activity.last_studied == ~N[2011-05-18 15:01:01]
      assert course_activity.retries == 43
      assert course_activity.strength == 43
    end

    test "update_course_activity/2 with invalid data returns error changeset" do
      course_activity = course_activity_fixture()
      assert {:error, %Ecto.Changeset{}} = Courses.update_course_activity(course_activity, @invalid_attrs)
      assert course_activity == Courses.get_course_activity!(course_activity.id)
    end

    test "delete_course_activity/1 deletes the course_activity" do
      course_activity = course_activity_fixture()
      assert {:ok, %CourseActivity{}} = Courses.delete_course_activity(course_activity)
      assert_raise Ecto.NoResultsError, fn -> Courses.get_course_activity!(course_activity.id) end
    end

    test "change_course_activity/1 returns a course_activity changeset" do
      course_activity = course_activity_fixture()
      assert %Ecto.Changeset{} = Courses.change_course_activity(course_activity)
    end
  end
end
