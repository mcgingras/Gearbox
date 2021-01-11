defmodule Gearbox.Page do
  @moduledoc """
  Page Component
  - acts as a container for content specific to the page
  - controls the horizontal margins of the content areas
  - has breadcrumbs, page title, page level actions
  """

  use Surface.Component

  @doc "The title"
  prop(title, :string, required: true)

  @doc "The subtitle"
  prop(subtitle, :string, required: false)
end
