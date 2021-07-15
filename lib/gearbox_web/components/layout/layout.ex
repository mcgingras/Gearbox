defmodule Gearbox.Layout do
  @moduledoc """
  Layout Component
  """
  use Surface.LiveComponent

  data(gapSize, :string, default: "gap-4")
  slot default
end
