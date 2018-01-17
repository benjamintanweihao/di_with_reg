defmodule RealStore do
  use GenServer

  def start_link(name \\ __MODULE__) do
    GenServer.start_link(__MODULE__, :ok, name: name)
  end

  def get(pid) do
    GenServer.call(pid, :get)
  end

  def init(:ok) do
    {:ok, _} = Registry.register(DiWithReg.Registry, :store, __MODULE__)
    {:ok, %{key: __MODULE__}}
  end

  def handle_call(:get, _from, state) do
    {:reply, state, state}
  end

end
