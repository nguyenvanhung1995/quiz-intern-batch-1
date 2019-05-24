class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :name
      t.date :birthday
      t.string :address
      t.string :role
      t.string :email

      t.timestamps
    end
  end
end
