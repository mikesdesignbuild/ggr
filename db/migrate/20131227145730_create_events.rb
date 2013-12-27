class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.date :on_date
      t.time :at_time
      t.integer :boat

      t.timestamps
    end
  end
end
