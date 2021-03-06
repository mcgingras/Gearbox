defmodule GearboxWeb.TreeSelectLive do
  use Surface.LiveView

  alias Gearbox.{Layout, Page, Section, Table, TreeSelect}

  @dataSource [
    %{
      key: "1",
      property: "name",
      description: "The label of the select field",
      type: "string",
      default: "-"
    },
    %{
      key: "2",
      property: "placeholder",
      description: "the placeholder value.",
      type: "string",
      default: "select a value"
    },
    %{
      key: "3",
      property: "treeData",
      description: "the actual data.",
      type: "map",
      default: "-"
    },
    %{
      key: "4",
      property: "multiple",
      description: "If the select field supports multiple values at the same time.",
      type: "boolean",
      default: "false"
    },
    %{
      key: "5",
      property: "onSelect",
      description: "The callback the calling Liveview receives onSelect action.",
      type: "atom",
      default: ":select"
    },
    %{
      key: "6",
      property: "selectedNodes",
      description:
        "The currently selected nodes (or node if multiple is false... still a list of size 1)",
      type: "List (MapSet)",
      default: "MapSet.new()"
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
end
