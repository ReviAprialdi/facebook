class CreateStatuses < ActiveRecord::Migration
  def change
    create_table :statuses do |t|
      t.integer :user_id
      t.text :status
      t.timestamp :time

      t.timestamps
    end
  end
end
