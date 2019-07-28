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

  test "adds an element with push" do
    SimpleQueue.push(1)
    assert SimpleQueue.queue == [1]
  end

  test "adds an element with emplace" do
    SimpleQueue.emplace(1)
    assert SimpleQueue.queue == [1]
  end

  test "removes an element with pop" do
    SimpleQueue.emplace(1)
    SimpleQueue.emplace(2)
    SimpleQueue.pop()
    assert SimpleQueue.size == 1
  end

  test "returns size of queue" do
    SimpleQueue.push(1)
    SimpleQueue.push(2)
    SimpleQueue.push(3)
    assert SimpleQueue.size == 3
  end

  test "swaps a queue" do
    SimpleQueue.push(1)
    SimpleQueue.push(2)
    assert SimpleQueue.size == 2
    SimpleQueue.swap([0,0,0,0])
    assert SimpleQueue.size == 4
    assert SimpleQueue.queue == [0,0,0,0]

  end

  test "returns front of queue" do
    SimpleQueue.push(1)
    SimpleQueue.push(2)
    assert SimpleQueue.front == 1
  end

  test "returns back of queue" do
    SimpleQueue.push(1)
    SimpleQueue.push(2)
    assert SimpleQueue.back == 2
  end


end
