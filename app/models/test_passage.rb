class TestPassage < ApplicationRecord
  belongs_to :user
  belongs_to :test
  belongs_to :current_question, class_name: 'Question', optional: true

  before_validation :before_validation_set_first_question, on: :create
  before_validation :before_validation_set_next_question, on: :update
  before_update :set_success

  SUCCEED_LEVEL = 0.85

  def same_categories_tests_passed
    user.test_passages.joins(:test).where(successful: true).where('tests.category_id = ?', test.category.id).distinct
  end

  def update_test_passage_status
    update_attribute(:successful, success?)
  end

  def completed?
    current_question.nil?
  end

  def success?
    if self.total >= SUCCEED_LEVEL
      return true
    end
  end

  def accept!(answer_ids)
    if correct_answer?(answer_ids)
      self.correct_questions += 1
    end

    save!
  end

  def current_question_count
    test.questions.order(:id).where('id < ?', current_question.id).count + 1
  end

  private

  def total
    self.correct_questions.to_f / self.test.questions.count.to_f
  end

  def before_validation_set_first_question
    self.current_question = test.questions.first if test.present?
  end
  
  def correct_answer?(answer_ids)
    correct_answer_count = correct_answers.count
    if answer_ids.nil?
      correct_answer_count = 0
    else
      (correct_answer_count == correct_answers.where(id: answer_ids).count) &&
      correct_answer_count == answer_ids.count
    end
  end

  def correct_answers
    current_question.answers.correct
  end

  def before_validation_set_next_question
    self.current_question = test.questions.order(:id).where('id > ?', current_question.id).first
  end

  def set_success
    self.successful = success? if completed?
  end

end
