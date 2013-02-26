
module ::Perspective::BindingTypes::ViewBindings::InstanceBinding
  
  include ::Perspective::View::ObjectAndInstanceBinding
  
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
  
  alias_method  :__render_value__, :__autobind_value__

  #############################
  #  __render_value_valid__?  #
  #############################

  def __render_value_valid__?( ensure_valid = false, view_rendering_empty = @__view_rendering_empty__ )
    
    render_value_valid = true

    if __required__? and ! view_rendering_empty and __value__.nil?
      render_value_valid = false
    elsif view = __view__
      render_value_valid = view.__render_value_valid__?( ensure_valid, view_rendering_empty )
    end

    if ensure_valid and ! render_value_valid
      raise ::Perspective::Bindings::Exception::BindingRequired.new( self )
    end
    
    return render_value_valid
    
  end
  
  ####################
  #  __view_count__  #
  ####################
  
  alias_method :__container_count__, :__view_count__
	
end