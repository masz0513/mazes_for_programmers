defmodule MazeAlgo.BinaryTree do
	alias MazeAlgo.{Cell, Grid, CellRandomPicker}

	def run(rows, columns) do
		grid = Grid.init(rows, columns)
		IO.puts %Grid{grid | matrix: do_process_rows(grid.matrix, [])}
	end

	defp do_process_rows([], acc), do: Enum.reverse(acc)
	defp do_process_rows([curr_row | other_rows], acc) do
		cells = do_process_cells(curr_row, [])
		do_process_rows(other_rows, [cells | acc])
	end

	defp do_process_cells([], acc), do: Enum.reverse(acc)
	defp do_process_cells([curr_cell | other_cells], acc) do
		neighbor = [curr_cell.north, curr_cell.east]
		|> CellRandomPicker.pick()
		|> (&(if &1 == nil, do: curr_cell, else: Cell.link(curr_cell, &1))).()

		do_process_cells(other_cells, [neighbor | acc])
	end
end