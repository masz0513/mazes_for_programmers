defmodule MazeAlgo.Sidewinder do
	alias MazeAlgo.{Cell, Grid, CellRandomPicker}

	def run(rows, columns) do
		grid = Grid.init(rows, columns)
		IO.puts %Grid{grid | matrix: do_process_rows(grid.matrix, [])}
	end

	defp do_process_rows([], acc), do: Enum.reverse(acc)
	defp do_process_rows([curr_row | other_rows], acc) do
		cells = do_process_cells(curr_row, [], [])
		do_process_rows(other_rows, [cells | acc])
	end

	defp do_process_cells([], _run, acc), do: Enum.reverse(acc)
	defp do_process_cells([curr_cell | other_cells], run, acc) do
		at_eastern_boundary = curr_cell.east == nil;
		at_northern_boundary = curr_cell.north == nil;

		should_close_out = at_eastern_boundary || 
											 (!at_northern_boundary && :rand.uniform(2) - 1 == 0)

		run = [curr_cell | run]
	  
	  if should_close_out do
	  	member = CellRandomPicker.pick(run)
	  	acc = [curr_cell | acc]

	  	acc = case member.north do
	  		nil ->
	  			acc
	  		_ ->
	  			acc
	  			|> Enum.map(&(if Cell.equal?(&1, member), do: Cell.link(&1, member.north), else: &1))
	  	end

  		do_process_cells(other_cells, [], acc)
  	else
  		curr_cell = Cell.link(curr_cell, curr_cell.east)
  		do_process_cells(other_cells, run, [curr_cell | acc])
	  end
	end
end