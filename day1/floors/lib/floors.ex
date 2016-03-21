defmodule Floors do
  def start_link do
    Agent.start_link(fn -> 0 end, name: __MODULE__)
  end

  def go_up do
    Agent.update(__MODULE__, fn floor -> floor+1 end)
  end

  def go_down do
    Agent.update(__MODULE__, fn floor -> floor-1 end)
  end

  def what_floor? do
    Agent.get(__MODULE__, fn floor -> floor end)
  end

  def reset do
    Agent.update(__MODULE__, fn floor -> 0 end)
  end
end
