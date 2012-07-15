
module ::Magnets::View::Bindings::InstanceBinding
  
  include ::Magnets::Bindings::InstanceBinding::Interface
  include ::Magnets::View::Configuration

  ###############
  #  view       #
  #  view=      #
  #  __view__   #
  #  __view__=  #
  ###############

  alias_method :__view__, :__container__
  alias_method :__view__=, :__container__=

  alias_method :view, :__view__
  alias_method :view=, :__view__=

	########################
	#  render_value        #
	#  autobind_value      #
	#  __render_value__    #
	#  __autobind_value__  #
	########################
	
	def __autobind_value__( current_value = __value__ )
	  
    return current_value
    
  end
  
  alias_method  :autobind_value, :__autobind_value__
  alias_method  :__render_value__, :__autobind_value__
  alias_method  :render_value, :__render_value__

  #########################
  #  render_value_valid?  #
  #########################

  def render_value_valid?( ensure_valid = false, view_rendering_empty = false )
    
    render_value_valid = true

    if required? and ! view_rendering_empty and __value__.nil?
      render_value_valid = false
    elsif view = __view__
      render_value_valid = view.render_value_valid?( ensure_valid, view_rendering_empty )
    end

    if ensure_valid and ! render_value_valid
      raise ::Magnets::Bindings::Exception::BindingRequired.new( self )
    end
    
    return render_value_valid
    
  end

end
