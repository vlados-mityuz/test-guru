class CreateBadges < ActiveRecord::Migration[6.1]
  def change
    create_table :badges do |t|
      t.string :title, null: false
      t.string :image_url, null: false
      t.string :description
      t.string :badge_type, null: false
      t.string :option

      t.timestamps
    end
  end
end