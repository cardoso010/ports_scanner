defmodule PortsScanner.ConnectionTest do
  use ExUnit.Case

  alias PortsScanner.Connection
  alias PortsScanner.Ports

  setup do
    Ports.start_link([])
    :ok
  end

  describe "test/2" do
    test "check host invalid" do
      assert nil == Connection.test("test", 80)
    end

    test "check host valid" do
      assert 80 == Connection.test("www.google.com.br", 80)
    end
  end
end
