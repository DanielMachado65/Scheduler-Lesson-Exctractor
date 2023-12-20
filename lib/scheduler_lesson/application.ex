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
      {DNSCluster, query: Application.get_env(:scheduler_lesson, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: SchedulerLesson.PubSub},
      # Start the Finch HTTP client for sending emails
      {Finch, name: SchedulerLesson.Finch},
      # Start a worker by calling: SchedulerLesson.Worker.start_link(arg)
      # {SchedulerLesson.Worker, arg},
      # Start to serve requests, typically the last entry
      SchedulerLessonWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: SchedulerLesson.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    SchedulerLessonWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
