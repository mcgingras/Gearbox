defmodule GearboxWeb.FieldLive do
  use Surface.LiveView

  alias Gearbox.{Layout, Page, Section, Table, TreeSelect}

  @dataSource [
    %{
      key: "1",
      property: "name",
      description: "The name of the field",
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

  @treeData %{
    "name" => "Fruits",
    "value" => "fruit",
    "children" => [
      %{"name" => "Banana", "value" => "fruit/banana", "children" => []},
      %{
        "name" => "Apple",
        "value" => "fruit/apple",
        "children" => [
          %{"name" => "Green Apple", "value" => "fruit/apple/green_apple", "children" => []}
        ]
      }
    ]
  }

  def mount(_session, _params, socket) do
    {:ok,
     assign(socket, %{
       dataSource: @dataSource,
       columns: @columns,
       treeData: @treeData
     })}
  end
end
