# reset entire database: DANGER for development only
# rm db/development.sqlite3; rm db/schema.rb; rake db:migrate; rake db:reset
# generate schema from model using: # http://localhost:4000/static_pages/schema.txt
class BaseSchema < ActiveRecord::Migration
  def change

    create_table :boats do |t|
      t.belongs_to :location

      t.string :name
      t.string :description
      t.integer :seats

      t.timestamps
    end

    create_table :events do |t|
      t.belongs_to :event_type
      t.belongs_to :location 
      t.belongs_to :boat

      t.datetime :start_datetime
      t.datetime :end_datetime
 
      t.timestamps
    end
    add_index :events, :start_datetime
    add_index :events, :end_datetime

    create_table :event_categories do |t|
      t.string :name
    
      t.timestamps
    end

    create_table :event_types do |t|
      t.belongs_to :event_category

      t.string :name
      t.string :long_name
      t.string :description

      t.timestamps
    end

    create_table :locations do |t|
      t.string :name
      t.string :description
      t.string :address
      t.boolean :is_default

      t.timestamps
    end

=begin
    create_table :users do |t|

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
      
      t.timestamps
    end
    add_index :members, :email,                unique: true
    add_index :members, :reset_password_token, unique: true
    # add_index :members, :confirmation_token,   :unique => true
    # add_index :members, :unlock_token,         :unique => true
=end

    create_table :members do |t|
      #t.references :user  # use just a member id
      t.string :name
      t.string :street
       t.boolean :street_shown
      t.string :mobile_number
       t.boolean :mobile_number_shown
      t.string :email
       t.boolean :email_shown
      t.string :interests
      t.string :purpose # why I like to row
      t.datetime :coxswain  # what year did you get approved for a coxswain
      t.datetime :captain   # what year did you get approved for a captain

      t.datetime :guest_on   # what year did you get approved for a captain
      t.datetime :joined_on   # what year did you get approved for a captain
      t.datetime :expired_on   # what year did you get approved for a captain

      t.timestamps
    end
    add_index :members, :name


    create_table :participations do |t|
      t.belongs_to :event
      t.belongs_to :member
      
      t.datetime :joined_on
      t.datetime :left_on

      t.string :rower
      t.string :captain
      t.string :coxswain
      t.string :guest

      t.boolean :missed
      t.boolean :late

      t.timestamps
    end
        
  end
end
