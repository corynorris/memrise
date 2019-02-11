defmodule MemriseWeb.Router do
  use MemriseWeb, :router

  pipeline :graphql do
    plug MemriseWeb.Context
  end

  # Other scopes may use custom stacks.
  scope "/" do
    pipe_through :graphql

    forward "/graphql", Absinthe.Plug,
      schema: MemriseWeb.Schema,
      json_codec: Jason

    forward "/graphiql", Absinthe.Plug.GraphiQL, schema: MemriseWeb.Schema, json_codec: Jason
  end
end
