defmodule MazeAlgo do
  alias MazeAlgo.{BinaryTree, Sidewinder}

  def generate(:binary_tree, rows, columns), do: BinaryTree.run(rows, columns)

  def generate(:sidewinder, rows, columns), do: Sidewinder.run(rows, columns)

  def generate(_, _rows, _columns), do: IO.puts "Unknown Algorithm"
end
