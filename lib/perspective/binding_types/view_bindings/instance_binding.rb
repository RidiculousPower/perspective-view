
module ::Perspective::BindingTypes::ViewBindings::InstanceBinding
    
  ##############
  #  __view__  #
  ##############

  alias_method :__view__, :__container__

  ###############
  #  __view__=  #
  ###############

  alias_method :__view__=, :__container__=

  ###########
  #  view   #
  ###########

  alias_method :view, :__view__

  ###########
  #  view=  #
  ###########

  alias_method :view=, :__view__=

  ######################
	#  __render_value__  #
	######################
  
  alias_method  :__render_value__, :__value__

  ################################
  #  required_bindings_present?  #
  ################################

  def required_bindings_present?
    
    render_value_valid = true

    if required? and __value__.nil?
      render_value_valid = false
    elsif view = __view__
      render_value_valid = view.required_bindings_present?
    end

    return render_value_valid
    
  end
  
  #######################################
  #  ensure_required_bindings_present!  #
  #######################################
  
  def ensure_required_bindings_present!
    
    unless rendering_empty? or required_bindings_present?
      raise ::Perspective::Bindings::Exception::BindingRequired.new( self )
    end
    
    return self
    
  end
  
  ####################
  #  __view_count__  #
  ####################
  
  alias_method :__view_count__, :__container_count__

  ######################
  #  rendering_empty!  #
  ######################
  
  def rendering_empty!
    
    @__view_rendering_empty__ = true
    
  end
  
  ######################
  #  rendering_empty?  #
  ######################
  
  def rendering_empty?
    
    return @__view_rendering_empty__ ||= false
    
  end
	
end
