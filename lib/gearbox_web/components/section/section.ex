defmodule Gearbox.Section do
  @moduledoc """
  Page Section
  Full Width
  One Third / Two Thirds (search results)
  Two Thirds / One Thirds (product pages)
  """

  use Surface.Component

  prop(type, :string, required: true, default: "full", values: ["full", "primary", "secondary"])
  slot default
end
