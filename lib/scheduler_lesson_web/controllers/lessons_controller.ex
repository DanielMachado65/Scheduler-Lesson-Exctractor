defmodule SchedulerLessonWeb.LessonController do
  use SchedulerLessonWeb, :controller

  alias SchedulerLesson.Repo
  alias SchedulerLesson.Document

  def create(conn, %{"document" => document_params}) do
    changeset = Document.changeset(%Document{}, document_params)

    case Repo.insert(changeset) do
      {:ok, _document} ->
        conn
        |> put_status(:created)
        |> json(%{message: "Document created successfully"})
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(SchedulerLessonWeb.ChangesetView, "error.json", changeset: changeset)
    end
  end
end
