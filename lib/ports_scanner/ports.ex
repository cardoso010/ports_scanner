defmodule PortsScanner.Ports do
  @moduledoc """
  Documentation for Ports.
  """
  use Agent

  @spec start_link(any) :: {:error, any} | {:ok, pid}
  def start_link(_opts) do
    Agent.start_link(fn -> [] end, name: __MODULE__)
  end

  @spec values :: any
  def values do
    Agent.get(__MODULE__, & &1)
  end

  @spec add(any) :: :ok
  def add(port) do
    Agent.update(__MODULE__, fn ports -> [port | ports] end)
  end
end
