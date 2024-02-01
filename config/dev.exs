import Config

# Configure your database
config :scheduler_lesson, SchedulerLesson.Repo,
  adapter: Mongo.Ecto,
  hostname: "localhost",
  port: 27017,
  database: "scheduler_lesson_dev",
  migration_source: "some_other_table_for_schema_migrations"

config :scheduler_lesson, SchedulerLessonWeb.Endpoint,
  http: [ip: {0, 0, 0, 0}, port: 4000],
  check_origin: false,
  code_reloader: true,
  debug_errors: true,
  secret_key_base: "X2WbeNbtN+tPGUfZ4ADcj9UPHpWJg4WKKSlvS+E3SFxkl7hXQ3iyaR1i0vfaUTnz",
  watchers: []

config :scheduler_lesson, dev_routes: true
config :logger, :console, format: "[$level] $message\n"
config :phoenix, :stacktrace_depth, 20
config :phoenix, :plug_init_mode, :runtime
