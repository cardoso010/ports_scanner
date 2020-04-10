defmodule PortsScanner.CLI do
  @moduledoc """
  Documentation for CLI.
  """
  alias PortsScanner

  def main(args) do
    args
    |> parse_args
    |> response
    |> IO.puts()
  end

  defp parse_args(args) do
    cmd_opts =
      args
      |> OptionParser.parse(switches: [host: :string, start_port: :integer, end_port: :integer])

    case cmd_opts do
      {[{_, host}], [start_port, end_port], _} ->
        {host, String.to_integer(start_port), String.to_integer(end_port)}

      _ ->
        :error
    end
  end

  defp response({host, start_port, end_port}) do
    PortsScanner.start(host, start_port, end_port)
  end
end
