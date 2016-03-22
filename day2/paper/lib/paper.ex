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
