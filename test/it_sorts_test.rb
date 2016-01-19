$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'it_sorts'
require 'minitest/autorun'

class TestItSorts < Minitest::Test
  class Box
    include ItSorts::SortSetup

    def initialize(weight)
      @weight = weight
    end

    def sort_setup
      ItSorts.ascending(@weight)
    end
  end

  def test_ascending_sort
    cargo1 = Box.new(1)
    cargo2 = Box.new(2)
    cargo3 = Box.new(3)

    assert_equal [cargo1, cargo2, cargo3], [cargo1, cargo3, cargo2].sort
  end

  class BankAccount
    include ItSorts::SortSetup

    def initialize(balance)
      @balance = balance
    end

    def sort_setup
      [ItSorts.descending(@balance)]
    end
  end

  def test_descending_sort
    account1 = BankAccount.new(100)
    account2 = BankAccount.new(2000)
    account3 = BankAccount.new(50000)

    assert_equal [account3, account2, account1], [account3, account1, account2].sort
  end

  class Task
    include ItSorts::SortSetup

    def initialize(importance, time_cost)
      @importance = importance
      @time_cost = time_cost
    end

    def sort_setup
      [ItSorts.descending(@importance), ItSorts.ascending(@time_cost)]
    end
  end

  def test_combined_sort
    task1 = Task.new(2, 60)
    task2 = Task.new(1, 30)
    task3 = Task.new(1, 5)

    assert_equal [task1, task3, task2], [task3, task1, task2].sort
  end

  class Line
    include ItSorts::SortSetup
    include ItSorts::Sorters

    def initialize(length)
      @length = length
    end

    def sort_setup
      ascending(@length)
    end
  end

  def test_included_sorters
    task1 = Line.new(1)
    task2 = Line.new(2)
    task3 = Line.new(3)

    assert_equal [task1, task2, task3], [task3, task1, task2].sort
  end

  class Glass
    include ItSorts::SortSetup

    def initialize(capacity)
      @capacity = capacity
    end

    def sort_setup
      ItSorts.asc(@capacity)
    end
  end

  def test_asc_alias
    glass1 = Glass.new(1)
    glass2 = Glass.new(2)

    assert_equal [glass1, glass2], [glass2, glass1].sort
  end

  class Screen
    include ItSorts::SortSetup

    def initialize(resolution)
      @resolution = resolution
    end

    def sort_setup
      ItSorts.desc(@resolution)
    end
  end

  def test_desc_alias
    screen1 = Screen.new(1)
    screen2 = Screen.new(2)

    assert_equal [screen2, screen1], [screen1, screen2].sort
  end
end
