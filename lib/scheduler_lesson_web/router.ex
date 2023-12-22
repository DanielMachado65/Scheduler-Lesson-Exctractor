defmodule SchedulerLessonWeb.Router do
  use SchedulerLessonWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", SchedulerLessonWeb do
    pipe_through :api
  end
end
