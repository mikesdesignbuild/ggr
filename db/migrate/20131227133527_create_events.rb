class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.on_date :
      t.at_time :
      t.participants :
      t.coxswain :
      t.captain :

      t.timestamps
    end
  end
end
