defmodule SchedulerLesson.Repo do
  use Ecto.Repo,
    otp_app: :scheduler_lesson,
    adapter: Ecto.Adapters.Mongo
end
