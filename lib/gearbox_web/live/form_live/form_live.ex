defmodule GearboxWeb.FormLive do
  use Surface.LiveView

  alias Gearbox.{Layout, Page, Section, Table, TreeSelect}

  @dataSource [
    %{
      key: "1",
      property: "for",
      description: "Changeset, or :name. What the form is for.",
      type: "any",
      default: "-"
    },
    %{
      key: "2",
      property: "change",
      description: "The event to trigger on form change (phx-change)",
      type: "event",
      default: "-"
    },
    %{
      key: "3",
      property: "submit",
      description: "The event to trigger on form submit (phx-submit)",
      type: "event",
      default: "-"
    },
    %{
      key: "4",
      property: "autocomplete",
      description: "If autocomplete is one for this form. One of ['on', 'off'].",
      type: "string",
      default: "on"
    }
  ]

  @columns [
    %{
      title: "Property",
      key: :property
    },
    %{
      title: "Description",
      key: :description
    },
    %{
      title: "Type",
      key: :type
    },
    %{
      title: "Default",
      key: :default
    }
  ]

  def mount(_session, _params, socket) do
    {:ok,
     assign(socket, %{
       dataSource: @dataSource,
       columns: @columns
     })}
  end
end
