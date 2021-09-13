class Test < ApplicationRecord
  has_many: users

  def self.tests_by_category(category_title)
    Test.where("title = ?", category_title).order("title DESC")  
  end
end
