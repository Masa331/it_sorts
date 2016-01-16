module ItSorts
  module SortBy
    def <=>(other)
      [*sort_setup] <=> [*other.sort_setup]
    end
  end
end
