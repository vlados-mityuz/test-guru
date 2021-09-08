class Test < ApplicationRecord
  def self.show_all_tests(title)
    Test.where("title = ?", title).order("title DESC")  
  end
end
