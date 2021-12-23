defmodule Utils do
  @type coordinate :: integer
  @type direction :: :N | :W | :E | :S
  @type move_direction :: :move_north | :move_south | :move_east | :move_west

  @spec get_classified_name(binary()) :: atom()
  def get_classified_name(name) do
    String.to_atom(name)
  end

  @spec get_direction_move_action(direction()) :: move_direction()
  def get_direction_move_action(d) do
    case d do
      :N -> :move_north
      :S -> :move_south
      :E -> :move_east
      :W -> :move_west
    end
  end
end
