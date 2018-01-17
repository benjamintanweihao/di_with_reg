defmodule DIWithReg do
  use Application

  def start(_, _) do
    DIWithReg.Supervisor.start_link()
  end

end
