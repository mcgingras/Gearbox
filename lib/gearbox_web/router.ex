defmodule GearboxWeb.Router do
  use GearboxWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_live_flash
    plug :put_root_layout, {GearboxWeb.LayoutView, :root}
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", GearboxWeb do
    pipe_through :browser

    live "/", HomeLive, :index
    live "/page", PageLive
    live "/form", FormLive
    live "/field", FieldLive
    live "/layout", LayoutLive
    live "/select", SelectLive
    live "/section", SectionLive
    live "/textarea", TextAreaLive
    live "/tree-node", TreeNodeLive
    live "/text-input", TextInputLive
    live "/tree-select", TreeSelectLive

    live "/scratch", ScratchLive
  end
end
