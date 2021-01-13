defmodule Gearbox.TreeSelect do
  @moduledoc """
  TreeSelect is a select field form element that displays option values in a tree like structure.
  """
  use Surface.LiveComponent
  alias Gearbox.TreeNode

  # defaultValue
  # treeDefaultExpandAll

  prop(name, :string)
  prop(placeholder, :string, default: "Select a value")
  prop(treeData, :map, required: true)
  prop(multiple, :boolean, default: false)
  data(selectedNodes, :list, default: MapSet.new())
  prop(onSelect, :atom, default: :select)

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
end
