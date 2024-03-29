defmodule SchedulerLesson.Application do
  use Application

  @impl true
  def start(_type, _args) do
    children = [
      SchedulerLessonWeb.Telemetry,
      SchedulerLesson.Repo,
      SchedulerLesson.Scheduler,
      {DNSCluster, query: Application.get_env(:scheduler_lesson, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: SchedulerLesson.PubSub},
      SchedulerLessonWeb.Endpoint
    ]

    opts = [strategy: :one_for_one, name: SchedulerLesson.Supervisor]
    Supervisor.start_link(children, opts)
  end

  @impl true
  def config_change(changed, _new, removed) do
    SchedulerLessonWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
