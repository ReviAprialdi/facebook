class CreateUserData < ActiveRecord::Migration
  def change
    create_table :user_data do |t|
      t.integer :user_id
      t.text :first_name
      t.text :last_name
      t.text :phone
      t.text :address

      t.timestamps
    end
  end
end
