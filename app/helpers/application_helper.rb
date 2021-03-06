module ApplicationHelper

  def is_singular?(str)
    str.pluralize.singularize == str
  end

  def mobile_device?
    if session[:mobile_param]
      session[:mobile_param] == "1"
    else
      request.user_agent =~ /Mobile|webOS/
    end
  end

  def is_foreign_key?(key)
    /_id$/.match(key)   # ends_with "_id"
  end

  # given a model like boat, return field_name for displaying instance label identifier
  def get_display_instance_field(model)  
    model.columns_hash.keys[1]  
  end

  def render_controller_action(controller, action)  # default render doesn't take separate "controller" and "view"
    render controller +"/"+ action rescue render "application/" + action 
  end

  # TBD: see  http://stackoverflow.com/questions/5452937/rails-previous-and-next-record-from-previous-query
  def prev_next_links
    output = ""
    instance_ids = cookies[:instance_ids].split(",")
    current_index = instance_ids.index(@instance.id.to_s)
    if current_index   # if not coming from an index page, then current_index is nil
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
    else
       ""
    end
  end

 def labelize(model)
  model.name.underscore.humanize
 end

 def labelize_inst(inst)  # use name field if present or id?
   inst ? inst["name"] || inst["id"] : "NIL-TODO"
 end

 def back_button
    link_to '< Back', :back 
 end

 def show_instance(instance)
   url = url_for controller: params[:controller], action: :show, id: instance.id 
   "window.location='" + url + "'"
 end

 def all_controller_names
  Dir.glob(Rails.root.to_s + '/app/models/*.rb').map do |filepath| 
    filename = filepath.match(/[^\/]*(?=[.][a-zA-Z]+$)/).to_s.pluralize 
    filename=="application_models" ? nil : filename  # converts "/Users/mike/dev/ggr/app/models/boat.rb" to "boats"
  end.compact
 end

# def back_button2
#    render inline: link_to "&lt; Back", document.referrer 
# end

end
