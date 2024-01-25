defmodule SchedulerLessonWeb.Router do
  use SchedulerLessonWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  get "/health_check", HealthCheckController, :index

  scope "/api", SchedulerLessonWeb do
    pipe_through :api
  end
end
