class Test < ApplicationRecord
  belongs_to :category
  has_many :questions
  belongs_to :creator, class_name: 'User', foreign_key: :creator_id, optional: true
  has_many :test_passages
  has_many :users, through: :test_passages

  validates :title, presence: true, uniqueness: { scope: :level }
  validates :level, numericality: { greater_than: 0 }, uniqueness: { scope: :title }

  scope :easy, -> { where(level: 0..1) }
  scope :medium, -> { where(level: 2..4) }
  scope :hard, -> { where(level: 5..Float::INFINITY) }
  scope :category_title, -> (category_title) { joins(:category).where(category: {title: category_title}) }


  def self.tests_by_category(category_title)
    Test.category_title(category_title).order("title DESC").pluck(:category_title)
  end
end

