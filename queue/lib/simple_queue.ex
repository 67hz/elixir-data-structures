defmodule SimpleQueue do
  use GenServer

  ### GenServer API


  @doc """
  GenServer.init/1 callback GenServer.init sets initial state through its return value.
  """
  def init(state), do: {:ok, state}

  @doc """
  GenServer.handle_call/3 callback
  handle_call is sync
  """
  def handle_call(:pop, _from, [value | state]) do
    {:reply, value, state}
  end

  def handle_call(:pop, _from, []), do: {:reply, nil, []}

  def handle_call(:size, _from, state) do
    {:reply, Kernel.length(state), state}
  end

  def handle_call(:front, _from, state) do
    {:reply, Kernel.hd(state), state}
  end

  def handle_call(:back, _from, state) do
    {:reply, List.last(state), state}
  end

  def handle_call(:empty, _from, state) do
    {:reply, Enum.empty?(state), state}
  end

  def handle_call(:queue, _from, state), do: {:reply, state, state}

  @doc """
  GenServer.handle_cast/2 callback
  """
  def handle_cast({:push, value}, state) do
    {:noreply, state ++ [value]}
  end


  def handle_cast({:emplace, value}, state) do

    # C++ emplace model doesn't really apply to immutable DS's in Elixir so...
    # new_state = state # creates copy of data
    # or
    new_state = Enum.to_list(state) ++ [value]
    {:noreply, new_state}

  end

  def handle_cast({:swap, new_list}, _state) do
    {:noreply, new_list}
  end


  ### Client API / Helper Functions

  @doc """
  Start our queue and link it.
  This is a helper function.
  """
  def start_link(state \\ []) do
    GenServer.start_link(__MODULE__, state, name: __MODULE__)
  end

  def queue, do: GenServer.call(__MODULE__, :queue)
  def empty, do: GenServer.call(__MODULE__, :empty)
  def size, do: GenServer.call(__MODULE__, :size)
  def front, do: GenServer.call(__MODULE__, :front)
  def back, do: GenServer.call(__MODULE__, :back)
  def push(value), do: GenServer.cast(__MODULE__, {:push, value})
  def pop, do: GenServer.call(__MODULE__, :pop)
  def swap(new_list), do: GenServer.cast(__MODULE__, {:swap, new_list})


  @doc """
  Create new instance of state and return with value appeneded to list.
  Modeled after C++ queue::emplace
  """
  def emplace(value), do: GenServer.cast(__MODULE__, {:emplace, value})




end
