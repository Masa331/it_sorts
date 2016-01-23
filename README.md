# ItSorts - tiny sorting helper

[![Build Status](https://travis-ci.org/Masa331/it_sorts.svg?branch=master)](https://travis-ci.org/Masa331/it_sorts)
[![Code Climate](https://codeclimate.com/github/Masa331/it_sorts/badges/gpa.svg)](https://codeclimate.com/github/Masa331/it_sorts)

**ItSorts provides a tiny helper for comprehensible array sorting.**

[![asciicast](https://asciinema.org/a/34559.png)](https://asciinema.org/a/34559)

## How `Array#sort` works and how to use ItSorts

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
Then sometimes you to want sort by more than one attribute. And you may also want to sort by one of them descendingly but ascendingly by the second one:
```
def <=>(other)
  [-1 * importance, time_cost] <=> [-1 * other.importance, other.time_cost]
end
```

Me personally, i had trouble to understand it properly first time. And then second time when i forgot the first time. What comes first, `other` or `self`? Why the flip? What's the default sort order? So i wrote this gem. With `ItSorts` you can write this instead:

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

And there is `.asc` alias to `.ascending` and `.desc` to `.descending`. Also if you include ItSorts::Sorters in your class you don't have to write `ItSorts` before sorter methods:
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

Also, if you had any other trouble with sorting in Ruby, let me know please, i'm definitelly interested.

Have a good one!

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/Masa331/it_sorts.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
