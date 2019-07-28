defmodule SimpleQueueTest do
  use ExUnit.Case
  doctest SimpleQueue

  setup do
    {:ok, server_pid} = SimpleQueue.start_link([])
    {:ok, server: server_pid}
  end

  test "starts with an empty queue" do
    assert SimpleQueue.empty == true
  end


end
