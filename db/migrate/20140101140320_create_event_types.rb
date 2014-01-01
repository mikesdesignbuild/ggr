class CreateEventTypes < ActiveRecord::Migration
  def change
    create_table :event_types do |t|
      t.string :name
      t.string :long_name
      t.string :description
      t.integer :category_id

      t.timestamps
    end
  end
end
