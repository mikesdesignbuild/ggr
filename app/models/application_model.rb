class ApplicationModel < ActiveRecord::Base
  self.abstract_class = true
  include ApplicationHelper
  include ApplicationValidators

  def self.id_for(name)  # used for seeds.  
  	self.where(name: name).first.id.to_s
  end

end
