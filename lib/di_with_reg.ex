defmodule DiWithReg do
  use Application

  def start(_, _) do
    DiWithReg.Supervisor.start_link()
  end

end
