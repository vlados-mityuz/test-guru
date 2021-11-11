class UpdateForeignKey < ActiveRecord::Migration[6.1]
  def change
    remove_foreign_key :questions, :tests
    add_foreign_key :questions, :tests, on_delete: :cascade
    remove_foreign_key :test_passages, :tests
    add_foreign_key :test_passages, :tests, on_delete: :cascade
    remove_foreign_key :answers, :questions
    add_foreign_key :answers, :questions, on_delete: :cascade
    remove_reference :test_passages, :current_question
    add_reference :test_passages, :current_question, null: true, foreign_key: { to_table: :questions }, on_delete: :cascade
  end
end
