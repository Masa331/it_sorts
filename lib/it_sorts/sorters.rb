module ItSorts
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
