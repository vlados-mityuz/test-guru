module QuestionsHelper
  def question_header(question, test)
    if question.new_record?
      "Create new '#{test.title}' question"
    elsif question.persisted?
      "Edit '#{test.title}' question"
    end
  end
end
