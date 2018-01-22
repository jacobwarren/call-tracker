defmodule TrackerWeb.Router do
  use TrackerWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", TrackerWeb do
    pipe_through :api
  end
end
