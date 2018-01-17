defmodule UseStore do
  use GenServer

  def start_link(conf) do
    GenServer.start_link(__MODULE__, conf)
  end

  def init(%{}) do
    {:ok, %{}}
  end

  def work(pid) do
    GenServer.call(pid, :work)
  end

  def handle_call(:work, _from, state) do
    entries = Registry.lookup(DIWithReg.Registry, :store)
    value = for {pid, module} <- entries do
      module.get(pid)
    end

    {:reply, value, state}
  end

end
