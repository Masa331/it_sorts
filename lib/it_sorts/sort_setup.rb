module ItSorts
  # Include this module in class you want to sort
  module SortSetup
    # This method is used by `Array#sort` in order to sort it's items.
    #   Here it's just rewritten that it uses #sort_setup for sorting.
    def <=>(other)
      [*sort_setup] <=> [*other.sort_setup]
    end

    # This method states how your objects are sorted.
    # Use either a single attribute or array of attributes you wan to sort by.
    # Use `ItSorts.ascending(your_attribute)` or `ItSorts.descending(your_attribute)` to state how it should be sorted.
    #
    # Example:
    #
    #   def sort_setup
    #     ItSorts.asc(importance)
    #   end
    #
    # or
    #
    #   def sort_setup
    #     [ItSorts.asc(importance), ItSorts.desc(time_cost)]
    #   end
    def sort_setup
      fail 'Patch this method with your sort setup.'
    end
  end
end
