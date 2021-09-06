class CreateAnswers < ActiveRecord::Migration[6.1]
  def change
    create_table :answers do |t|
      t.string :body
      t.integer :test_id
      t.boolean :correct
      t.integer :question_id

      t.timestamps
    end
    change_column_null(:answers, :body, false)
    change_column_null(:answers, :test_id, false)
    change_column_null(:answers, :question_id, false)
    change_column_default(:answers, :correct, from: nil, to: false)
  end
end
