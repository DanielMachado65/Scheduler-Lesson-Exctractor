import Config

config :scheduler_lesson,
  ecto_repos: [SchedulerLesson.Repo],
  generators: [timestamp_type: :utc_datetime]

# Configures the endpoint
config :scheduler_lesson, SchedulerLessonWeb.Endpoint,
  url: [host: "localhost"],
  adapter: Phoenix.Endpoint.Cowboy2Adapter,
  render_errors: [
    formats: [json: SchedulerLessonWeb.ErrorJSON],
    layout: false
  ],
  pubsub_server: SchedulerLesson.PubSub,
  live_view: [signing_salt: "7mE4uNTa"]

config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

config :phoenix, :json_library, Jason
import_config "#{config_env()}.exs"
