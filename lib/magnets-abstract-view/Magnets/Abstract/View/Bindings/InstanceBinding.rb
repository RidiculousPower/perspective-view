
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

  #########################
  #  render_value_valid?  #
  #########################

  def render_value_valid?
    
    render_value_valid = true
    
    if required? and __value__.nil?
      render_value_valid = false
    end
    
    return render_value_valid
    
  end
  
  alias_method  :ensure_render_value_valid, :render_value_valid?

	######################
	#  render_value      #
	#  __render_value__  #
	######################
	
	def __render_value__( current_value = __value__ )
	  
    return current_value
    
  end
  
  alias_method  :render_value, :__render_value__

  ################################
  #  __set_value_in_container__  #
  ################################
  
  def __set_value_in_container__
    
    if container = __container__
      container.__autobind__( __render_value__ )    
    end
    
  end

end
