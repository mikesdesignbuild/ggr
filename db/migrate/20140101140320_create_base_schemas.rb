class CreateBaseSchemas < ActiveRecord::Migration
  def change
    create_table(:members) do |t|

      ## Database authenticatable
      t.string :email,              null: false, default: ""
      t.string :encrypted_password, null: false, default: ""

      ## Recoverable
      t.string   :reset_password_token
      t.datetime :reset_password_sent_at

      ## Rememberable
      t.datetime :remember_created_at

      ## Trackable
      t.integer  :sign_in_count, default: 0, null: false
      t.datetime :current_sign_in_at
      t.datetime :last_sign_in_at
      t.string   :current_sign_in_ip
      t.string   :last_sign_in_ip

      ## Confirmable
      # t.string   :confirmation_token
      # t.datetime :confirmed_at
      # t.datetime :confirmation_sent_at
      # t.string   :unconfirmed_email # Only if using reconfirmable

      ## Lockable
      # t.integer  :failed_attempts, :default => 0, :null => false # Only if lock strategy is :failed_attempts
      # t.string   :unlock_token # Only if unlock strategy is :email or :both
      # t.datetime :locked_at
      
      t.boolean  :admin

      t.timestamps
    end

    add_index :members, :email,                unique: true
    add_index :members, :reset_password_token, unique: true
    # add_index :members, :confirmation_token,   :unique => true
    # add_index :members, :unlock_token,         :unique => true

    create_table :member_profiles do |t|
      t.references :member  # use just a member id
      t.string :name
      t.string :interests
      t.string :purpose # why I like to row
      # t.integer :coxswain  # what year did you get approved for a coxswain
      # t.integer :captain   # what year did you get approved for a captain
      # t.image :face_photo

      t.timestamps
    end
    add_index :member_profiles, :name

    create_table :event_locations do |t|
      t.string :name
      t.string :description
      t.string :address

      t.timestamps
    end

    create_table :event_types do |t|
      t.string :name
      t.string :long_name
      t.string :description
      t.integer :category_id

      t.timestamps
    end

    create_table :events do |t|
      t.date :on_date
      t.time :at_time
      #t.references :boat
      t.string :boat

      t.timestamps
    end
    add_index :events, :on_date

    create_table :participations do |t|
      t.references :event
      t.references :member

      t.string :captain
      t.string :coxswain
      t.boolean :missed
      t.boolean :late

      t.timestamps
    end

    create_table :boats do |t|
      t.string :name
      t.integer :seats

      t.timestamps
    end
        
  end
end
