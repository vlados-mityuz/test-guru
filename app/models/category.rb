class Category < ApplicationRecord
  has_many :tests

  scope :list_by_name, -> { order(:title) }
end
