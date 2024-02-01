defmodule SchedulerLessonWeb.Router do
  use SchedulerLessonWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", SchedulerLessonWeb do
    pipe_through :api

    get "/health_check", HealthCheckController, :index
    # post "/lesson", DocumentController, :create
  end
end
