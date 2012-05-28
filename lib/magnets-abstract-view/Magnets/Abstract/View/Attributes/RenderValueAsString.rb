
module ::Magnets::Abstract::View::Attributes::RenderValueAsString

	######################
	#  render_value      #
	#  __render_value__  #
	######################
	
	def __render_value__( current_value = __value__ )
	  
    return current_value.to_s
    
  end
  
  alias_method  :render_value, :__render_value__

end
