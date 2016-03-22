defmodule Paper do
  # Public methods
  def surface?(dimensions) when is_tuple(dimensions) do
    list_sides(dimensions)
    |> Enum.sum
  end
  def surface?(dimensions) do
    make_tuple(dimensions)
    |> surface?
  end

  def slack?(dimensions) when is_tuple(dimensions) do
    list_sides(dimensions)
    |> Enum.sort
    |> List.first
  end
  def slack?(dimensions) do
    make_tuple(dimensions)
    |> slack?
  end

  def total?(dimensions) do
    surface?(dimensions) + slack?(dimensions)
  end

  def bow?(dimensions) when is_tuple(dimensions) do
    dimensions
    |> Tuple.to_list
    |> Enum.reduce(fn(x, acc) -> x * acc end)
  end
  def bow?(dimensions) do
    make_tuple(dimensions)
    |> bow?
  end
  # Private methods
  defp make_tuple(dimensions) do
    to_string(dimensions)
    |> String.split("x")
    |> strlist_to_int
    |> List.to_tuple
  end

  defp strlist_to_int(strlist) do
    for item <- strlist do
      String.to_integer(item)
    end
  end

  defp list_sides({l, w, h}) do
    sides = [
      l*w,
      w*h,
      h*l
    ]
    sides ++ sides
  end
end
