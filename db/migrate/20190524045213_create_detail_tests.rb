class CreateDetailTests < ActiveRecord::Migration[5.1]
  def change
    create_table :detail_tests do |t|
      t.references :question, foreign_key: true
      t.references :test, foreign_key: true
      t.integer :answer_id

      t.timestamps
    end
  end
end
