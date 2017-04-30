# MazeAlgo

Exercises for [Mazes for Programmers](https://pragprog.com/book/jbmaze/mazes-for-programmers)

## Installation

```
git clone git@github.com:masz0513/mazes_for_programmers.git
cd mazes_for_programmers
iex -S mix
```

### Example

```elixir
iex> MazeAlgo.generate(:binary_tree, 10, 10)
+---+---+---+---+---+---+---+---+---+---+
|                                       |
+---+   +   +   +   +---+---+   +   +   +
|       |   |   |   |           |   |   |
+   +   +---+---+---+---+   +   +   +   +
|   |   |                   |   |   |   |
+   +   +   +---+   +   +   +---+   +   +
|   |   |   |       |   |   |       |   |
+---+---+---+---+---+---+   +   +   +   +
|                           |   |   |   |
+   +   +   +   +---+   +   +---+   +   +
|   |   |   |   |       |   |       |   |
+---+   +---+   +   +---+---+---+---+   +
|       |       |   |                   |
+   +---+---+   +---+---+---+   +---+   +
|   |           |               |       |
+   +   +---+   +   +---+---+   +   +   +
|   |   |       |   |           |   |   |
+---+---+   +   +   +   +   +---+   +   +
|           |   |   |   |   |       |   |
+---+---+---+---+---+---+---+---+---+---+
```
