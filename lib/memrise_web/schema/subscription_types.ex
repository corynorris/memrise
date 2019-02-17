defmodule MemriseWeb.Schema.CourseSubscriptionTypes do
  use Absinthe.Schema.Notation
  alias MemriseWeb.Resolvers

  import Absinthe.Resolution.Helpers, only: [dataloader: 1]

  object :course_subscription do
    field :course_id, :id
    field :user_id, :id
  end

  object :course_subscription_queries do
  end

  object :course_subscription_mutations do
    @desc "Subscribe to a course"
    field :subscribe_to_course, type: :course_subscription do
      arg(:course_id, non_null(:id))
      resolve(&Resolvers.Subscription.subscribe_to_course/3)
    end

    @desc "Unsubscribe from a course"
    field :unsubscribe_from_course, type: :course_subscription do
      arg(:course_id, non_null(:id))
      resolve(&Resolvers.Subscription.unsubscribe_from_course/3)
    end
  end
end
