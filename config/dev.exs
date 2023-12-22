import Config

# Configure your database
config :scheduler_lesson, SchedulerLesson.Repo,
  database: Path.expand("../scheduler_lesson_dev.db", Path.dirname(__ENV__.file)),
  pool_size: 5,
  stacktrace: true,
  show_sensitive_data_on_connection_error: true

config :scheduler_lesson, SchedulerLessonWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4000],
  check_origin: false,
  code_reloader: true,
  debug_errors: true,
  secret_key_base: "X2WbeNbtN+tPGUfZ4ADcj9UPHpWJg4WKKSlvS+E3SFxkl7hXQ3iyaR1i0vfaUTnz",
  watchers: []

config :scheduler_lesson, dev_routes: true
config :logger, :console, format: "[$level] $message\n"
config :phoenix, :stacktrace_depth, 20
config :phoenix, :plug_init_mode, :runtime
