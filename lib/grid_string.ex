defimpl String.Chars, for: MazeAlgo.Grid do
	alias MazeAlgo.Cell

  def to_string(nil), do: ""

  def to_string([]), do: ""

  def to_string(grid) do
  	rows_str = Enum.reduce(grid.matrix, "", fn (row, acc) -> 
			{side, top} = row_to_string(row)
  		"#{acc}#{top}\n#{side}\n"
  	end)

  	border_bottom = "+" <> Enum.reduce(0..grid.columns - 1, "", fn(_, acc) ->  "---+#{acc}" end) <> "\n"
  	"#{rows_str}#{border_bottom}"
  end

  defp row_to_string(row) do
  	Enum.reduce(row, {"|", "+"}, fn(curr_cell, acc) ->
			{side, top} = acc

			cell = case curr_cell do
				nil -> Cell.init(-1, -1)
				_ -> curr_cell
			end

			east_boundary = case Cell.linked?(cell, cell.east) do
				true -> " "
				_ -> "|"
			end
			side = "#{side}   #{east_boundary}"

			north_boundary = case Cell.linked?(cell, cell.north) do
				true -> "   "
				_ -> "---"
			end
			top = "#{top}#{north_boundary}+"

			{side, top}
		end)
  end
end
