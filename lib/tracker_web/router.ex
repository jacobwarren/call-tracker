defmodule TrackerWeb.Router do
  use TrackerWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
    plug Tracker.Auth.Pipeline
    plug TrackerWeb.Context
  end

  scope "/" do
    pipe_through :api

    forward "/api", Absinthe.Plug,
      schema: TrackerWeb.Schema

    forward "/graphiql", Absinthe.Plug.GraphiQL,
      schema: TrackerWeb.Schema,
      socket: TrackerWeb.UserSocket 
  end
end
