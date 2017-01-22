module ItSorts
  # This module contains sort helpers you can use in your `sort_setup` method.
  module Sorters
    def ascending(value)
      value
    end
    alias asc ascending

    def descending(value)
      -1 * value
    end
    alias desc descending
  end
end
