defmodule GearboxWeb.HomeLive do
  use Surface.LiveView

  alias Gearbox.Page

  @impl true
  def mount(_params, _session, socket) do
    {:ok, socket}
  end
end
