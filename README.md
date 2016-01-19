# ItSorts - tiny sorting helper

[![Code Climate](https://codeclimate.com/github/Masa331/it_sorts/badges/gpa.svg)](https://codeclimate.com/github/Masa331/it_sorts)

**ItSorts provides a tiny helper for comprehensible array sorting.**

If you want to use `Array#sort` with your custom POROs you have to define `#<=>(other)` on them:

```ruby
class Task
  attr_accessor :importance

  def <=>(other)
    importance <=> other.importance
  end
end
```
Ruby sorts ascendingly so you get task with lowest importance first. To get task with highest importance you have to flip sides:
```
def <=>(other)
  other.importance <=> importance
end
```
or
```
def <=>(other)
  -1 * importance <=> -1 * other.importance
end
```
Then sometimes you want sort by more than one attribute. And you may also want to sort by one of them descendingly but ascendingly by the second one:
```
def <=>(other)
  [-1 * importance, time_cost] <=> [-1 * other.importance, other.time_cost]
end
```

For me personally it was kinda hard to understand it the first time around. Why the flip? Also what comes first, `other` or `self`? What's the default sort order? So i wrote this gem. With ItSorts you can write this instead:

```ruby
require 'it_sorts'

class Task
  include ItSorts::SortSetup

  attr_accessor :importance, :time_cost

  def sort_setup
    [ItSorts.descending(importance), ItSorts.ascending(time_cost)]
  end
end
```
If you sort by just one attribute:
```ruby
  def sort_setup
    ItSorts.descending(importance)
  end
```

And there is `.asc` alias to `.ascending` and `.desc` to `.descending`. Also if you include ItSorts::Sorters in your class you don't have to write `ItSorts` before sorters methods:
```ruby
require 'it_sorts'

class Task
  include ItSorts::SortSetup
  include ItSorts::Sorters

  attr_accessor :importance, :time_cost

  def sort_setup
    [desc(importance), asc(time_cost)]
  end
end
```

This gem doesn't need much to work really. It's about 20 LOC. If you find it too little to be in a gem look inside and copy the modules right inside your projects :)

Have a good one!

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/Masa331/it_sorts.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
