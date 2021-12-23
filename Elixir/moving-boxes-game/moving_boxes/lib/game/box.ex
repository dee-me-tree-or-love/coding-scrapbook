# TODO: consider if macros / behaviours could be used to reduce duplication
defmodule Box do
  @moduledoc """
  Representing the moveable Box
  """
  @type coordinate :: integer
  @type direction :: :N | :W | :E | :S
  @type name :: String.t()
  @type state :: %Box{direction: direction(), name: name(), x: coordinate(), y: coordinate()}

  use GenServer
  defstruct [:x, :y, :direction, :name]

  @doc """
  Public function for starting the link with this box.
  """
  @spec start_link({coordinate(), coordinate(), direction(), name()}) :: GenServer.on_start()
  def start_link({x, y, d, name}) do
    GenServer.start_link(__MODULE__, {x, y, d, name}, name: Utils.get_classified_name(name))
  end

  @spec init({coordinate(), coordinate(), direction(), name()}) :: {:ok, state()}
  def init({x, y, d, name}) do
    {:ok, %__MODULE__{x: x, y: y, direction: d, name: name}}
  end

  @spec get_state(name()) :: any
  def get_state(name) do
    GenServer.call(String.to_atom(name), :get_state)
  end

  def handle_call(:get_state, _from, state) do
    {:reply, {:ok, {state.x, state.y, state.direction, state.name}}, state}
  end

  @spec move({direction(), name()}) :: atom()
  def move({d, name}) do
    Utils.get_direction_move_action(d)
    |> (fn x -> GenServer.cast(Utils.get_classified_name(name), x) end).()
  end

  def handle_cast(:move_north, state) do
    {:noreply, %__MODULE__{state | y: state.y + 1}}
  end

  def handle_cast(:move_south, state) do
    {:noreply, %__MODULE__{state | y: state.y - 1}}
  end

  def handle_cast(:move_east, state) do
    {:noreply, %__MODULE__{state | x: state.x + 1}}
  end

  def handle_cast(:move_west, state) do
    {:noreply, %__MODULE__{state | x: state.x - 1}}
  end
end
