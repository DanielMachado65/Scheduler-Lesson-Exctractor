defmodule SchedulerLessonWeb.HealthCheckController do
  use SchedulerLessonWeb, :controller

  def index(conn, _params) do
    conn
    |> put_status(:ok)
    |> json(%{status: "ok"})
  end
end
