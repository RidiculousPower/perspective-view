
module ::Magnets::Abstract::View::Bindings::InstanceBinding
  
  include ::Magnets::Bindings::InstanceBinding::Configuration
  include ::Magnets::Abstract::View::Configuration

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

	######################
	#  render_value      #
	#  __render_value__  #
	######################
	
	def __render_value__( current_value = __value__ )
	  
    return current_value
    
  end
  
  alias_method  :render_value, :__render_value__

  #########################
  #  render_value_valid?  #
  #########################

  def render_value_valid?( ensure_valid = false, view_rendering_empty = false )
    
    render_value_valid = true
    
    if required? and __value__.nil?
      render_value_valid = false
    elsif view = __view__
      render_value_valid = view.render_value_valid?( ensure_valid, view_rendering_empty )
    end

    if ensure_valid and ! render_value_valid
      raise ::Magnets::Bindings::Exception::BindingRequired.new( self )
    end
    
    return render_value_valid
    
  end

  ################################
  #  __set_value_in_container__  #
  ################################
  
  def __set_value_in_container__
    
    if container = __container__
      container.__autobind__( __render_value__ )    
    end
    
  end

end
