defmodule GearboxWeb.ScratchLive do
  use Surface.LiveView

  alias Gearbox.{Layout, Page, Section, Table, TreeSelect}

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

  @treeData %{
    "name" => "Fruits",
    "value" => "fruit",
    "children" => [
      %{"name" => "Banana", "value" => "fruit/banana", "children" => []},
      %{"name" => "Orange", "value" => "fruit/orange", "children" => [
        %{"name" => "Tangerine", "value" => "fruit/orange/tangerine", "children" => []},
        %{"name" => "Clementine", "value" => "fruit/orange/clementine", "children" => []}
      ]},
      %{
        "name" => "Apple",
        "value" => "fruit/apple",
        "children" => [
          %{"name" => "Green Apple", "value" => "fruit/apple/green_apple", "children" => [
            %{"name" => "Granny Smith", "value" => "fruit/apple/green_apple/granny_smith", "children" => []}
          ]}
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

  def handle_event("change", params, socket) do
    
    IO.inspect(params)
    {:noreply, socket}
  end
end
