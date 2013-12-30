class CreateParticipations < ActiveRecord::Migration
  def change
    create_table :participations do |t|
      t.references :event
      t.references :member

      t.string :captain
      t.string :coxswain
      t.boolean :missed
      t.boolean :late

      t.timestamps
    end
  end
end
