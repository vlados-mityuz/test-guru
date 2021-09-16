class CreateTests < ActiveRecord::Migration[6.1]
  def change
    create_table :tests do |t|
      t.string :title, null: false
      t.integer :level, default: 1
      t.references :category, foreign_key: true, null: false
      t.integer :creator_id, foreign_key: true, null: false, index: true
      
      t.timestamps
    end
  end
end
