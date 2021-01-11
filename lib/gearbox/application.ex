defmodule Gearbox.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      Gearbox.Repo,
      # Start the Telemetry supervisor
      GearboxWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: Gearbox.PubSub},
      # Start the Endpoint (http/https)
      GearboxWeb.Endpoint
      # Start a worker by calling: Gearbox.Worker.start_link(arg)
      # {Gearbox.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Gearbox.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    GearboxWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
