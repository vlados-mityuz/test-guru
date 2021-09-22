class User < ApplicationRecord
  has_many :created_tests, class_name: 'Test', foreign_key: :creator_id
  has_many :test_passages
  has_many :tests, through: :test_passages

  def show_passed_tests(level)
    tests.where(level: level)
  end

  def test_passage(test)
    test_passages.order(id: :desc).find_by(test_id: test.id)
  end
end