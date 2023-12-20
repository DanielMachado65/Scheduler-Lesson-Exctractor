defmodule Scheduler.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      Scheduler.Repo,
      {DNSCluster, query: Application.get_env(:scheduler, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: Scheduler.PubSub},
      {Finch, name: Scheduler.Finch}
      # Start a worker by calling: Scheduler.Worker.start_link(arg)
      # {Scheduler.Worker, arg},
      # Start to serve requests, typically the last entry
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Scheduler.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
