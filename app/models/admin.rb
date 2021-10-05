class Admin < User

  validates :first_name, presence
  validates :last_name, presence
  
end
