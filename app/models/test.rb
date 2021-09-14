class Test < ApplicationRecord
  has_many: users
  has_many: category

  def self.tests_by_category(category_title)
    Test.joins(:category).where("title = ?", category_title).order("title DESC").pluck(:category_title)
  end
end
