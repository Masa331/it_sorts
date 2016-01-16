$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'it_sorts'
require 'minitest/autorun'

class TestItSorts < Minitest::Test
  class Box
    include ItSorts::SortBy

    def initialize(weight)
      @weight = weight
    end

    def sort_setup
      ItSorts.asc(@weight)
    end
  end

  def test_ascending_sort
    cargo1 = Box.new(1)
    cargo2 = Box.new(2)
    cargo3 = Box.new(3)

    assert_equal [cargo1, cargo2, cargo3], [cargo1, cargo3, cargo2].sort
  end

  class BankAccount
    include ItSorts::SortBy

    def initialize(balance)
      @balance = balance
    end

    def sort_setup
      [ItSorts.desc(@balance)]
    end
  end

  def test_descending_sort
    account1 = BankAccount.new(100)
    account2 = BankAccount.new(2000)
    account3 = BankAccount.new(50000)

    assert_equal [account3, account2, account1], [account3, account1, account2].sort
  end

  class Task
    include ItSorts::SortBy

    def initialize(importance, time_cost)
      @importance = importance
      @time_cost = time_cost
    end

    def sort_setup
      [ItSorts.desc(@importance), ItSorts.asc(@time_cost)]
    end
  end

  def test_combined_sort
    task1 = Task.new(2, 60)
    task2 = Task.new(1, 30)
    task3 = Task.new(1, 5)

    assert_equal [task1, task3, task2], [task3, task1, task2].sort
  end

  class Line
    include ItSorts::SortBy
    include ItSorts::Sorters

    def initialize(length)
      @length = length
    end

    def sort_setup
      asc(@length)
    end
  end

  def test_included_sorters
    task1 = Line.new(1)
    task2 = Line.new(2)
    task3 = Line.new(3)

    assert_equal [task1, task2, task3], [task3, task1, task2].sort
  end
end
