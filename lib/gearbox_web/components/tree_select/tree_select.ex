defmodule Gearbox.TreeSelect do
  @moduledoc """
  TreeSelect is a select field form element that displays
  option values in a tree like structure. Any data with
  hierarchical structure is a good fit for TreeSelect.

  See TreeNode for complementary information.
  """
  use Surface.LiveComponent
  alias Gearbox.TreeNode

  # defaultValue
  # treeDefaultExpandAll

  prop(name, :string)
  prop(placeholder, :string, default: "Select a value")

  @doc"""
  treeData is strictly the presentational data --
  does not change with changes to UI state (open/close)
  which is why we have another map for storing that info
  """
  prop(treeData, :map, required: true)

  @doc"""
  If multiple is true, the treeSelect component
  supports selecting multiple tags as it's value.
  """
  prop(multiple, :boolean, default: false)
  data(selectedNodes, :list, default: MapSet.new())

  @doc"""
  A callback function name triggered by events selecting tags.
  Uses `send` to send a function to the parent liveview.
  Not sure if I need / or will be using this yet, but it's a
  pattern I was open to exploring.
  """
  prop(onSelect, :atom, default: :select)
  prop expandedMap,:any, default: MapSet.new()


  def handle_event("selectValue", %{"select" => selectedNode}, socket) do
    selectedNode = Jason.decode!(selectedNode)

    selectedNodes =
      case socket.assigns.multiple do
        true -> MapSet.put(socket.assigns.selectedNodes, selectedNode)
        false -> MapSet.new([selectedNode])
      end


    # send(socket.root_pid, {socket.assigns.onSelect, selectedNodes})
    {:noreply, assign(socket, %{selectedNodes: selectedNodes})}
  end

  def handle_event("mark-open", %{"select" => name}, socket) do
    set =
    if (MapSet.member?(socket.assigns.expandedMap, name)) do
      MapSet.delete(socket.assigns.expandedMap, name)
    else
      MapSet.put(socket.assigns.expandedMap, name)
    end
    {:noreply, assign(socket, %{expandedMap: set})}
  end
end
