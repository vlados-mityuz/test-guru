class AddAnswersBodyAndTestIdNullConstraint < ActiveRecord::Migration[6.1]
  def change
    change_column_null(:answers, :body, false)
    change_column_null(:answers, :test_id, false)
  end
end
