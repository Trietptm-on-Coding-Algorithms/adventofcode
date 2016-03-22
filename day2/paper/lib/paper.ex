defmodule Paper do
  def surface?(dimensions) when is_tuple(dimensions) do
    list_sides(dimensions)
    |> Enum.sum
  end
  def surface?(dimensions) do
    make_tuple(dimensions)
    |> surface?
  end
  def make_tuple(dimensions) do
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

  def make_sides({l, w, h}) do
    [
      2*l*w,
      2*w*h,
      2*h*l
    ]
  end
end
