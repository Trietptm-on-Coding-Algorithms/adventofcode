defmodule Mix.Tasks.Paper.Manifest do
  use Mix.Task

  @shortdoc "Process a manifest of packages"

  def run(args) do
    File.stream!(args)
    |> Enum.map(&clean_entry(&1))
    |> Enum.map(&Paper.total?(&1))
    |> Enum.sum
    |> IO.puts
  end

  defp clean_entry (entry) do
    entry
    |> to_string
    |> String.strip
  end
end
