defmodule MultiDbDemo.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Ecto repositories
      MultiDbDemo.Repo.V1,
      MultiDbDemo.Repo.V2,
      # Start the Telemetry supervisor
      MultiDbDemoWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: MultiDbDemo.PubSub},
      # Start the Endpoint (http/https)
      MultiDbDemoWeb.Endpoint
      # Start a worker by calling: MultiDbDemo.Worker.start_link(arg)
      # {MultiDbDemo.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: MultiDbDemo.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    MultiDbDemoWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
