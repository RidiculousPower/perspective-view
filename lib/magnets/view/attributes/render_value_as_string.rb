
module ::Magnets::View::Attributes::RenderValueAsString

	########################
	#  render_value        #
	#  autobind_value      #
	#  __render_value__    #
	#  __autobind_value__  #
	########################
	
	def __autobind_value__( current_value = __value__ )
	  
    return current_value.to_s
    
  end
  
  alias_method  :autobind_value, :__autobind_value__
  alias_method  :__render_value__, :__autobind_value__
  alias_method  :render_value, :__render_value__

end
