class StaticPagesController < ApplicationController
  def home
  end

  def help
  end

  def schema   # http://localhost:3000/static_pages/schema.txt
  	@models = all_model_names.map do |model_name| 
  	  model = model_name.constantize
      model.all.count # load into memory
      model
    end

=begin  ADD TO DOC
From model/Boats.rb with:
class Boat < ActiveRecord::Base 
  include ApplicationHelper

  validates :name, presence: true, uniqueness: true, simple_word: true
  validates :description, default: "", simple_text: true
  validates :seats, default: 0, numericality: { only_integer: true, greater_than: 0, less_than: 100 }  # small_positive_integer  

  has_one     :location   # can be changed by captain 
    validates :location, default: "MG" #, presence: true

  has_many :events, inverse_of: :boat

end 

Generates:
create_table :boats do |t|
  t.string :name
  t.string :description
  t.integer :seats
  t.references :location

  t.timestamps
end
=end

  end

  private
     def all_model_names
	  Dir.glob(Rails.root.to_s + '/app/models/*.rb').map do |filename| 
	    filename.match(/[^\/]*(?=[.][a-zA-Z]+$)/).to_s.classify  # converts "/Users/mike/dev/ggr/app/models/boat.rb" to "boats"
	 end
 end
end
