class CreateParticipations < ActiveRecord::Migration
  def change
    create_table :participations do |t|
      t.references :event
      t.references :member

      t.boolean :captain
      t.boolean :coxswain
      t.boolean :participated
      t.boolean :late

      t.timestamps
    end
  end
end
