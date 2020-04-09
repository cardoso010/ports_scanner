defmodule PortsScannerTest do
  use ExUnit.Case
  doctest PortsScanner

  @host "www.google.com"

  describe "start/1" do
    test "should return [80]" do
      assert PortsScanner.start(@host, 79, 81) == [80]
    end

    test "should return []" do
      assert PortsScanner.start(@host, 1, 2) == []
    end
  end
end
