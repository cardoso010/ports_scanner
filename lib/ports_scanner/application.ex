defmodule PortsScanner.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application
  # alias PortsScanner.Ports

  def start(_type, _args) do
    children = [
      # Starts a worker by calling: PortsScanner.Worker.start_link(arg)
      # {PortsScanner.Worker, arg}
      # Ports
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: PortsScanner.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
