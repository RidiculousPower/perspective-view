
module ::Perspective::View::BindingDefinitions::RenderValueAsString

	######################
	#  __render_value__  #
	######################
	
	def __render_value__( current_value = __value__ )
	  
    return current_value.to_s
    
  end

end
