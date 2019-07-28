# Queue

A simple queue based off C++ STL queue interface.

* `empty/0` - returns whether queue is empty
* `size/0` - returns size of queue. Uses `Kernel.length` under the hood
* `swap/1` - exchange contents of provided queue with current queue held in state
* `front/0` - returns queue head
* `back/0` - returns last element of queue
* `push/1` - adds element to end of queue
* `pop/1` - deletes first element of queue

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `simple_queue` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:simple_queue, "~> 0.1.0"}
  ]
end
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at [https://hexdocs.pm/simple_queue](https://hexdocs.pm/simple_queue).

