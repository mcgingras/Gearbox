defmodule GearboxWeb.PageLive do
  use Surface.LiveView

  alias Gearbox.{Layout, Page, Section, Table}

  @dataSource [
    %{
      key: "1",
      property: "placeholder",
      description: "the placeholder value.",
      type: "string",
      default: "select a value"
    },
    %{
      key: "2",
      property: "treeData",
      description: "the actual data.",
      type: "map",
      default: "-"
    },
    %{
      key: "3",
      property: "value",
      description: "the active value of the tree select.",
      type: "string",
      default: "-"
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
