defmodule MazeAlgo.CellRandomPicker do
	def pick(cells) do
		cells
		|> Enum.filter(&(&1 != nil))
		|> do_pick()
	end

	defp do_pick([]), do: nil
	defp do_pick([cell]), do: cell
	defp do_pick(cells) do
		count = Enum.count(cells)
		Enum.at(cells, :rand.uniform(count) - 1)
	end
end