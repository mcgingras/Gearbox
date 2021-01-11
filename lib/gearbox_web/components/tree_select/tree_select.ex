defmodule Gearbox.TreeSelect do
  @moduledoc """
  TreeSelect is a select field form element that displays option values in a tree like structure.
  """
  use Surface.Component
  alias Gearbox.TreeNode

  # defaultValue
  # multiple
  # treeDefaultExpandAll
  # onSelect

  prop(placeholder, :string, default: "Select a value")
  prop(treeData, :map, required: true)
  data(value, :string)
end
