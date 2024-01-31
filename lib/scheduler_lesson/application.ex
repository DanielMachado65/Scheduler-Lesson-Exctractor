defmodule SchedulerLesson.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      SchedulerLessonWeb.Telemetry,
      SchedulerLesson.Repo,
      {Quantum, [name: SchedulerLesson.Scheduler]}
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
