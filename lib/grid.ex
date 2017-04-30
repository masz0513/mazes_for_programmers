defmodule MazeAlgo.Grid do
	alias MazeAlgo.{Cell, Grid}

	defstruct rows: 0, columns: 0, matrix: []

	def init(rows, columns) do
		%Grid{rows: rows, columns: columns}
		|> do_prepare_grid()
		|> do_configure_cells()
	end

	defp do_prepare_grid(grid) do
		matrix = Enum.reduce(0..grid.rows - 1, [], fn(row, acc) -> 
			row_data = Enum.reduce(0..grid.columns - 1, [], fn(col, acc) -> 
				[Cell.init(row, col) | acc]
			end)

			[Enum.reverse(row_data) | acc]
		end)
		|> Enum.reverse()

		%Grid{grid | matrix: matrix}
	end

	defp do_configure_cells(grid) do
		%Grid{grid | matrix: do_process_rows(grid.matrix, grid, [])}
	end

	defp do_process_rows([], _, acc), do: Enum.reverse(acc)
	defp do_process_rows([curr_row | other_rows], grid, acc) do
		cells = do_process_cells(curr_row, grid, [])
		do_process_rows(other_rows, grid, [cells | acc])
	end

	defp do_process_cells([], _, acc), do: Enum.reverse(acc)
	defp do_process_cells([curr_cell | other_cells], grid, acc) do
		curr_cell = %Cell{curr_cell | 
			north: do_get_neighbor(curr_cell.row - 1, curr_cell.column, grid),
			south: do_get_neighbor(curr_cell.row + 1, curr_cell.column, grid),
			west: do_get_neighbor(curr_cell.row, curr_cell.column - 1, grid),
			east: do_get_neighbor(curr_cell.row, curr_cell.column + 1, grid)
		}

		do_process_cells(other_cells, grid, [curr_cell | acc])
	end

	defp do_get_neighbor(row, col, grid) do
		cond do
			(row < 0 or row >= grid.rows or col < 0 or col >= grid.columns) ->
				nil
			true ->
				{:ok, row_data} = Enum.fetch(grid.matrix, row)
				{:ok, cell} = Enum.fetch(row_data, col)
				cell
		end
	end
end