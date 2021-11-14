class UpdateForeignKey < ActiveRecord::Migration[6.1]
  def change
    remove_reference :test_passages, :current_question
    add_reference :test_passages, :current_question, null: true, foreign_key: { to_table: :questions }, on_delete: :cascade
  end
end
