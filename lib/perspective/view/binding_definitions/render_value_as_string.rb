
module ::Perspective::View::BindingDefinitions::RenderValueAsString

	########################
	#  __autobind_value__  #
	########################
	
	def __autobind_value__( current_value = __value__ )
	  
    return current_value.to_s
    
  end

	######################
	#  __render_value__  #
	######################
  
  alias_method  :__render_value__, :__autobind_value__

end
