defmodule SchedulerLesson.Repo do
  use Ecto.Repo,
    otp_app: :scheduler_lesson,
    adapter: Ecto.Adapters.SQLite3
end
