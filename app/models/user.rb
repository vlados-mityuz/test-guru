class User < ApplicationRecord
  has_many: tests

  def show_passed_tests(level)
    tests.where(level: level)
  end
end