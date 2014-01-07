class ApplicationModel < ActiveRecord::Base
  self.abstract_class = true
  include ApplicationHelper
  include ApplicationValidators
  include ActionView::Helpers::DateHelper  # for time_ago_in_words

  def display_name
    name || id
  end

  def self.id_for(name)  # used for seeds.  
  	self.where(name: name).first.id
  end
  def self.find_one(name)  # used for seeds.  
    self.where(name: name).first
  end
  def self.user_class_methods   # returns array of method_names for class methods on a model (typically queries).  def self.foo
    Member.methods(false).map do |k| 
      key = k.to_s  
      # assume user class method if name doesn't start with "_" or "before_" or "after_"
      key[0]=="_" || key[0..6]=="before_" || key[0..5]=="after_" || key=="reflections" ? nil : key
    end.compact
  end

end
