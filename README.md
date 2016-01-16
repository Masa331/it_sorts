# ItSorts - tiny sorting helper

[![Code Climate](https://codeclimate.com/github/Masa331/it_sorts/badges/gpa.svg)](https://codeclimate.com/github/Masa331/it_sorts)

ItSorts provides a tiny helper for more comprehensible array sorting.

I build it because i didn't like writing this:

```ruby
class Task
  attr_accessor :importance, :time_cost

  ...

  def <=>(other)
    [importance, -1 * time_cost] <=> [other.importance, -1 * other.time_cost]
  end
end
```

Why the `-1 *` really?

## Usage

```ruby
class Task
  include SortIt::SortSetup

  ...

  def order_setup
    [SortIt.desc(importance), SortIt.asc(time_cost)]
  end
end
```

Then anywhere `[task1, task2].sort` will give you sorted array how you defined it previously.

For sorting by just one attribute:
```ruby
class Task
  include SortIt::SortSetup

  attr_accessor :importance

  ...

  def order_setup
    SortIt.desc(importance)
  end
end
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/Masa331/it_sorts.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

Have a good one!
