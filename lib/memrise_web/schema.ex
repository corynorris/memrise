defmodule MemriseWeb.Schema do
  use Absinthe.Schema

  import_types(MemriseWeb.Schema.UserTypes)
  import_types(MemriseWeb.Schema.CourseTypes)
  import_types(MemriseWeb.Schema.CardTypes)

  def plugins do
    [Absinthe.Middleware.Dataloader] ++ Absinthe.Plugin.defaults()
  end

  mutation do
    import_fields(:user_mutations)
    import_fields(:course_mutations)
    import_fields(:card_mutations)
  end

  query do
    import_fields(:user_queries)
    import_fields(:course_queries)
    import_fields(:card_queries)
  end
end
