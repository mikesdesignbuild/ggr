module ApplicationHelper

  # given a model like boat, return field_name for displaying instance label identifier
  def get_display_instance_field(model)  
    model.columns_hash.keys[1]  
  end

  # TBD: see  http://stackoverflow.com/questions/5452937/rails-previous-and-next-record-from-previous-query
  def prev_next_links
    output = ""
    instance_ids = cookies[:instance_ids].split(",")
    current_index = instance_ids.index(@instance.id.to_s)
    prev_index = current_index - 1
       prev_index < 0 ? prev_index=nil : nil
    next_index = current_index + 1 
       next_index >= instance_ids.length ? next_index=nil : nil
    model_name = @model.name.pluralize.underscore
    if !prev_index.nil? 
      prev_id = instance_ids[prev_index]
      output += link_to "< Prev", "/#{model_name}/#{prev_id}" # TODO: better way to construct links?
    end
    if !next_index.nil? 
      next_id = instance_ids[next_index]
      output += link_to "Next >", "/#{model_name}/#{next_id}" # TODO: better way to construct links?
    end
    output.html_safe
  end

 def labelize(model)
  model.name.underscore.humanize
 end

 def back_button
    link_to '< Back', :back 
 end

 def show_instance(instance)
   url = url_for controller: params[:controller], action: :show, id: instance.id 
   "window.location='" + url + "'"
 end

 def all_controller_names
  Dir.glob(Rails.root.to_s + '/app/models/*.rb').map do |filename| 
    filename.match(/[^\/]*(?=[.][a-zA-Z]+$)/).to_s.pluralize  # converts "/Users/mike/dev/ggr/app/models/boat.rb" to "boats"
  end
 end

# def back_button2
#    render inline: link_to "&lt; Back", document.referrer 
# end
  
 class EmailValidator < ActiveModel::EachValidator  # used in models as:  validates :useremail, email: true
  def validate_each(record, attribute, value)
    if value && value =~ /\A([^@\s])@((?:[-a-z0-9]\.)[a-z]{2,})\z/i
      record.errors[attribute] << (options[:message] || "is not an email")
    end
  end
 end

 class DatetimeValidator < ActiveModel::EachValidator  # used in models as:  validates :useremail, datetime: true
  def validate_each(record, attribute, value)
    if value && !DateTime.parse(value) 
      record.errors[attribute] << "must be a valid datetime" 
    end 
  end
 end

 class DateValidator < ActiveModel::EachValidator  # used in models as:  validates :on_date, date: true
  def validate_each(record, attribute, value)
    if value && !DateTime.parse(value) 
     record.errors[attribute] << "must be a valid date"
    end
  end
 end

 class TimeValidator < ActiveModel::EachValidator
   def validate_each(record, attribute, value)
     if value && !value.kind_of?(Time)
       record.errors[attribute] << (options[:message] || "don't recognize time")
     end
   end
 end

 class SimpleWordValidator < ActiveModel::EachValidator
   def validate_each(record, attribute, value)
     # 2 to 8 characters, all ASCII letters
     # format: { with: /\A[a-zA-Z]\z/, message: "only allows letters" }, length: { in: 2..8 } 
   end
 end

 class SimpleTextValidator < ActiveModel::EachValidator
   def validate_each(record, attribute, value)
     # 2 to 8 characters, all ASCII letters
     # format: { with: /\A[a-zA-Z]\z/, message: "only allows letters" }, length: { in: 8..100 }
   end
 end

 class IpAddressValidator < ActiveModel::EachValidator
   def validate_each(record, attribute, value)
     # IP address such as 192.0.0.1
   end
 end

 class BooleanValidator < ActiveModel::EachValidator
   def validate_each(record, attribute, value)
     if value && !%w[true false].include?(value.to_s)
       record.errors[attribute] << (options[:message] || "don't recognize boolean value")
     end
   end
 end

 class CantWantWouldValidator < ActiveModel::EachValidator
   def validate_each(record, attribute, value)
     if value && !%w[cant want would].include?(value.to_s)
       record.errors[attribute] << (options[:message] || "valid values are: cant, want, would")
     end
   end
 end

 class DefaultValidator < ActiveModel::EachValidator
   def validate_each(record, attribute, value)
     #if !value
       #record[attribute] = value  
     #end
     # this means field is optional, and it gets its default from the validations instance. 
   end
 end

end
