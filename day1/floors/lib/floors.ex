defmodule Floors do
  def start_link do
    Agent.start_link(fn -> {0,0,0} end, name: __MODULE__)
  end

  def go_up do
    Agent.update(__MODULE__,
      fn {floor, basement, operations} -> {floor+1, basement, operations+1} end)
  end

  def go_down do
    Agent.update(__MODULE__, fn state -> do_down(state) end)
  end

  def floor? do
    Agent.get(__MODULE__, fn {floor, _basement, _operations} -> floor end)
  end

  def basement? do
    Agent.get(__MODULE__, fn {_floor, basement, _operations} -> basement end)
  end

  def operations? do
    Agent.get(__MODULE__, fn {_floor, _basement, operations} -> operations end)
  end

  def reset do
    Agent.update(__MODULE__, fn _ -> {0,0,0} end)
  end

  def process(directions) when is_list(directions) do
    :ok = Floors.reset
    for dir <- directions do
      case dir do
        ?( -> Floors.go_up
        ?) -> Floors.go_down
        _ -> dir
      end
    end
    :ok
  end

  def process(directions) do
    process(to_char_list(directions))
  end

  defp do_down({floor, 0, operations}) do
    case floor do
      0 -> {floor-1, operations+1, operations+1}
      _ -> {floor-1, 0, operations+1}
    end
  end

  defp do_down({floor, basement, operations}) do
    {floor-1, basement, operations+1}
  end
end
