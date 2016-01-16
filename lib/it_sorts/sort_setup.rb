module ItSorts
  module SortSetup
    def <=>(other)
      [*sort_setup] <=> [*other.sort_setup]
    end
  end
end
