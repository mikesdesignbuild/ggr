class BaseModel < ActiveRecord::Base
	self.abstract_class = true
  include ApplicationHelper

  def self.find_name(name)
  	self.where(name: name)
  end

  def persisted?
    false
  end

end
