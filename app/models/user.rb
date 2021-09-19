class User < ApplicationRecord
  has_many :tests_users
  has_many :created_tests, class_name: 'Test', foreign_key: :creator_id
  has_and_belongs_to_many :tests, through: :tests_users

  def show_passed_tests(level)
    tests.where(level: level)
  end
end