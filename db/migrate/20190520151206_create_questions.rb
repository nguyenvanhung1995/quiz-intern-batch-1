class CreateQuestions < ActiveRecord::Migration[5.1]
  def change
    create_table :questions do |t|
      t.integer :category_id
      t.text :content
      t.string :image

      t.timestamps
    end
  end
end
