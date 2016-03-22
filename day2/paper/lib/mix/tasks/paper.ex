defmodule Mix.Tasks.Paper.Manifest do
  use Mix.Task

  @shortdoc "Process a manifest of packages"

  def run(args) do
    File.stream!(args)
    |> Enum.map(&clean_entry(&1))
    |> Enum.map(&get_totals(&1))
    |> Enum.reduce(fn({paper, ribbon}, {p_acc, r_acc}) -> {paper + p_acc, ribbon + r_acc} end)
    |> IO.inspect
  end

  defp clean_entry (entry) do
    entry
    |> to_string
    |> String.strip
  end

  defp get_totals(dimensions) do
    {
      Paper.total?(dimensions),
      Paper.total_ribbon?(dimensions)
    }
  end
end
