defmodule Gearbox.Table do
  use Surface.Component

  prop(dataSource, :list, required: true)
  prop(columns, :list, required: true)
end
