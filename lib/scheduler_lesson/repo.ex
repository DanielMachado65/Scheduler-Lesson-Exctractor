defmodule SchedulerLesson.Repo do
  use Ecto.Repo,
    otp_app: :scheduler_lesson,
    adapter: Mongo.Ecto
end
