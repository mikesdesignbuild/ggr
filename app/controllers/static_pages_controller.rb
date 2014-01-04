class StaticPagesController < ApplicationController
  def home
  end

  def help
  end

  def schema
  	@models = all_model_names.map do |model_name| 
  	  model = model_name.constantize
      model.all.count # load into memory
      model
    end
  end

  private
     def all_model_names
	  Dir.glob(Rails.root.to_s + '/app/models/*.rb').map do |filename| 
	    filename.match(/[^\/]*(?=[.][a-zA-Z]+$)/).to_s.classify  # converts "/Users/mike/dev/ggr/app/models/boat.rb" to "boats"
	 end
 end
end
