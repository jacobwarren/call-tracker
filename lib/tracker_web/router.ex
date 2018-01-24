defmodule TrackerWeb.Router do
  use TrackerWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
    plug Tracker.Auth.Pipeline
    plug TrackerWeb.Context
  end

  scope "/" do
    pipe_through :api

    forward "/graphiql", Absinthe.Plug.GraphiQL,
      schema: TrackerWeb.Schema

    forward "/", Absinthe.Plug,
      schema: TrackerWeb.Schema
  end
end
