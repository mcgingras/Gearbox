defmodule Gearbox.TreeNode do
  @moduledoc """
  TreeNode is a single node in a TreeSelect hierarchy.
  Not to be used individually, but called from within
  the TreeSelectComponent.

  Due to Surface library having a limitation where you may
  not call a component recursively within itself,
  the TreeNode component implements a helper function to
  handle that recursion on it's behalf.
  """

  use Surface.Component

  @doc """
    The node currently being rendered.
    Passed down from TreeSelect.
    Map%{
      name: name,
      value: value,
      children: [%Node{}]
    }
  """
  prop(node, :map, required: true)

  def render(assigns) do
    ~H"""
      {{ render_node(@node) }}
    """
  end

  defp render_node(assigns) do
    ~H"""
      <div x-data="{open: true}" class="bg-white">
        <div class="flex relative items-center hover:bg-gray-100 px-2">
          <svg
            :if={{ length(assigns["children"]) > 0 }}
            @click="open = !open"
            :class="{'-rotate-0': open, '-rotate-90': !open }"
            class="transform h-3 w-3 text-gray-300 cursor-pointer hover:text-gray-700"
            fill="currentColor"
            viewBox="0 0 292.362 292.362" >
            <path d="M286.935 69.377c-3.614-3.617-7.898-5.424-12.848-5.424H18.274c-4.952 0-9.233 1.807-12.85 5.424C1.807 72.998 0 77.279 0 82.228c0 4.948 1.807 9.229 5.424 12.847l127.907 127.907c3.621 3.617 7.902 5.428 12.85 5.428s9.233-1.811 12.847-5.428L286.935 95.074c3.613-3.617 5.427-7.898 5.427-12.847 0-4.948-1.814-9.229-5.427-12.85z" />
          </svg>
          <div :if={{ length(assigns["children"]) === 0 }} class="w-3"></div>
          <h2 class="cursor-pointer flex-1 p-2 text-gray-700 text-sm">{{ assigns["name"] }}</h2>
        </div>

        <div x-show="open" class="pl-4" :if={{ length(assigns["children"]) > 0 }} :for={{ childNode <- assigns["children"] }}>
          {{ render_node(childNode) }}
        </div>
      </div>
    """
  end
end
