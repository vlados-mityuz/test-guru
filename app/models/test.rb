class Test < ApplicationRecord
  belongs_to :category
  has_many :questions
  has_many :tests_users
  belongs_to :creator, class_name: 'User', foreign_key: :creator_id
  has_and_belongs_to_many :users, through: :tests_users

  validates :title, presence: true, uniqueness: true
  validates :level, numerically: { greater_than: 0 }, uniqueness: true

  scope :easy, -> { where(level: 0..1) }
  scope :medium, -> { where(level: 2..4) }
  scope :hard, -> { where(level: 5..Float::INFINITY) }
  scope :tests_by_category, -> (title) { joins(:category).where(category: {title: title}).order(title: :desc).pluck(:title) }
end
