# TODO: consider if macros / behaviours could be used to reduce duplication
defmodule Target do
  @moduledoc """
  Representing the static Target for the box
  """
  @type coordinate :: integer
  @type name :: String.t()
  @type state :: %Target{name: name(), x: coordinate(), y: coordinate(), box_count: integer()}

  use GenServer
  defstruct [:x, :y, :box_count, :name]

  @doc """
  Public function for starting the link with this target.
  """
  @spec start_link({coordinate(), coordinate(), name()}) :: GenServer.on_start()
  def start_link({x, y, name}) do
    GenServer.start_link(__MODULE__, {x, y, name}, name: Utils.get_classified_name(name))
  end

  @spec init({coordinate(), coordinate(), name()}) :: {:ok, state()}
  def init({x, y, name}) do
    {:ok, %__MODULE__{x: x, y: y, box_count: 0, name: name}}
  end

  @spec get_state(name()) :: any
  def get_state(name) do
    GenServer.call(String.to_atom(name), :get_state)
  end

  def handle_call(:get_state, _from, state) do
    {:reply, {:ok, {state.x, state.y, state.box_count, state.name}}, state}
  end

  @spec consume_box(name()) :: atom()
  def consume_box(name) do
    GenServer.cast(Utils.get_classified_name(name), :consume_box)
  end

  def handle_cast(:consume_box, state) do
    {:noreply, %__MODULE__{state | box_count: state.box_count + 1}}
  end
end
