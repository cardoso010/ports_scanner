defmodule PortsScanner do
  @moduledoc """
  Documentation for PortsScanner.
  """
  alias PortsScanner.Connection
  alias PortsScanner.Ports

  def start(host \\ "localhost", start_port \\ 1, end_port \\ 100) do
    Ports.start_link([])

    stream =
      start_port..end_port
      |> Task.async_stream(fn port -> Connection.test(host, port) end,
        timeout: 250,
        on_timeout: :kill_task
      )

    Stream.run(stream)
    Ports.values()
  end
end
