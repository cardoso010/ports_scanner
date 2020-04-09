defmodule PortsScanner.PortsTest do
  use ExUnit.Case

  alias PortsScanner.Ports

  setup do
    Ports.start_link([])
    :ok
  end

  describe "values/0" do
    test "get default value" do
      assert [] == Ports.values()
    end

    test "get a value added" do
      Ports.add(80)
      assert [80] == Ports.values()
    end
  end

  describe "add/1" do
    test "add a new value" do
      assert :ok == Ports.add(80)
    end

    test "check if value was added" do
      Ports.add(80)
      assert [80] == Ports.values()
    end
  end
end
