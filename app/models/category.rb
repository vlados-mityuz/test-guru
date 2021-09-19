class Category < ApplicationRecord
  has_many :tests

  validates :title, presence: true

  scope :list_by_name, -> { order(:title) }
end
