defmodule DiWithReg.Supervisor do
  use Supervisor

  def start_link do
    Supervisor.start_link(__MODULE__, :ok, name: __MODULE__)
  end

  def init(:ok) do
    Supervisor.init([
      {Registry, keys: :duplicate, name: DiWithReg.Registry},
      {RealStore, nil}
    ], strategy: :one_for_one)
  end
end
