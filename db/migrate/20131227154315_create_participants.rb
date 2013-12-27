class CreateParticipants < ActiveRecord::Migration
  def change
    create_table :participants do |t|
      t.integer :user
      t.integer :event
      t.boolean :captain
      t.boolean :coxswain
      t.boolean :participated
      t.boolean :late

      t.timestamps
    end
  end
end
