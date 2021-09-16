class Test < ApplicationRecord
  belongs_to :category
  has_many :questions
  has_many :tests_users
  belongs_to :creator, class_name: 'User', foreign_key: :creator_id
  has_and_belongs_to_many :users, through: :tests_users

  def self.tests_by_category(category_title)
    Test.joins(:category).where(category: {title: category_title}).order("title DESC").pluck(:category_title)
  end
end
