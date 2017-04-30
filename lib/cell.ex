defmodule MazeAlgo.Cell do
	alias MazeAlgo.Cell

	defstruct row: -1, 
		column: -1, 
		north: nil, 
		south: nil,
		east: nil,
		west: nil,
		links: []

	def init(row, column) do
		%Cell{row: row, column: column}
	end

	def link(cell, cell_to_link) do
		%Cell{cell | links: [cell_to_link | cell.links]}
	end

	def unlink(cell, cell_to_unlink) do
		cell.links
		|> Enum.take_while(&(!Cell.equal?(&1, cell_to_unlink)))
		|> (&(%Cell{cell | links: &1})).()
	end

	def linked?(_cell, nil), do: false
	def linked?(cell, linked_cell) do
		Enum.any?(cell.links, &(&1.row == linked_cell.row && &1.column == linked_cell.column))
	end

	def equal?(cell1, cell2) do
		cell1.row == cell2.row && cell1.column == cell2.column
	end

	def neighbors(cell) do
		do_add_neighbor([], cell.north)
		|> do_add_neighbor(cell.south)
		|> do_add_neighbor(cell.east)
		|> do_add_neighbor(cell.west)
	end
	defp do_add_neighbor(list, nil), do: list
	defp do_add_neighbor(list, cell), do: [cell | list]
end