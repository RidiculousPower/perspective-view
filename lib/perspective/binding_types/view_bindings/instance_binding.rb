
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

  ####################################
  #  __required_bindings_present__?  #
  ####################################

  def __required_bindings_present__?( ensure_present = false, view_rendering_empty = @__view_rendering_empty__ )
    
    render_value_valid = true

    if __required__? and ! view_rendering_empty and __value__.nil?
      render_value_valid = false
    elsif view = __view__
      render_value_valid = view.__required_bindings_present__?( ensure_present, view_rendering_empty )
    end

    if ensure_present and ! render_value_valid
      raise ::Perspective::Bindings::Exception::BindingRequired.new( self )
    end
    
    return render_value_valid
    
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
  
  ##########################
  #  __rendering_empty__?  #
  ##########################
  
  def __rendering_empty__?
    
    return @__view_rendering_empty__ ||= false
    
  end
	
end
