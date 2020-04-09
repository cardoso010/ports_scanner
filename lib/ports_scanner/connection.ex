defmodule PortsScanner.Connection do
  @moduledoc """
  Documentation for Connection.
  """
  alias PortsScanner.Ports

  @doc """
  Function that test if port is open or close.

  ## Examples
    iex> Connection.test("localhost", 80)
    80

    iex> Connection.test("localhost")
    nil
  """
  def test(host \\ "localhost", port \\ 0) do
    ip = to_charlist(host)
    opts = [:binary, active: false]
    connection = :gen_tcp.connect(ip, port, opts)

    case connection do
      {:ok, socket} ->
        :gen_tcp.close(socket)
        Ports.add(port)
        port

      _ ->
        nil
    end
  end
end
