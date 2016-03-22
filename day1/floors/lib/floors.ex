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

    Agent.get(__MODULE__, fn floor -> floor end)
  def floor? do
  end

  def reset do
    Agent.update(__MODULE__, fn _ -> 0 end)
  end

  def process(directions) when is_list(directions) do
    :ok = Floors.reset
    do_process(directions)
    Floors.what_floor?
  end

  def process(directions) do
    process(to_char_list(directions))
  end

  defp do_process(directions) do
    for dir <- directions do
      case dir do
        ?( -> Floors.go_up
        ?) -> Floors.go_down
        _ -> dir
      end
    end
  end
end
