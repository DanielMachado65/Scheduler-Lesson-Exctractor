defmodule SchedulerLessonWeb.LessonController do
  use SchedulerLessonWeb, :controller

  alias SchedulerLesson.ExtractorAllAsyncJob
  alias SchedulerLesson.ExtractorAsyncJob
  alias SchedulerLesson.Repo
  alias SchedulerLesson.Lesson

  import Ecto.Query

  def index(conn, _params) do
    lessons = sample_query()

    conn
    |> put_status(:ok)
    |> json(%{lessons: lessons})
  end

  def extract_all(conn, _params) do
    ExtractorAllAsyncJob.perform_async()

    conn
    |> put_status(:created)
    |> json(%{message: "Job scheduled"})
  end

  def create(conn, %{"type" => "latest"} = params) do
    ExtractorAsyncJob.perform_async()

    conn
    |> put_status(:created)
    |> json(%{message: "Job scheduled"})
  end

  # def show(conn, params) do
  #   lessons =
  #     if Enum.empty?(params) do
  #       Lesson |> limit(10) |> Repo.all()
  #     else
  #       Lesson |> where(^params) |> limit(10) |> Repo.all()
  #     end

  #   json(conn, %{lessons: lessons, meta: %{total: Repo.aggregate(Lesson, :count, :id)}})
  # end

  # def latest(conn, _params) do
  #   lesson = Lesson |> order_by(desc: :date) |> Repo.one()
  #   json(conn, %{lesson: lesson})
  # end

  def show(conn, %{"id" => id}) do
    lesson = Lesson |> Repo.get(id)
    json(conn, %{lesson: lesson})
  end

  defp sample_query do
    query =
      from(w in Lesson)

    Repo.all(query)
  end
end
