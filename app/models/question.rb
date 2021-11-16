class Question < ApplicationRecord
  has_many :answers, dependent: :destroy
  has_many :gists, dependent: :destroy
  has_many :current_questions, class_name: 'TestPassage', foreign_key: :current_question_id, dependent: :destroy
  belongs_to :test

  validates :body, presence: true
end
