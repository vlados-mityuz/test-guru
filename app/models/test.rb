class Test < ApplicationRecord
  has_many: users
  has_many: categories

  def self.tests_by_category(category_title)
    Test.where("title = ?", category_title).order("title DESC")  
  end
end
