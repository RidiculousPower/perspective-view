
module ::Magnets::Abstract::View::Attributes::RenderValueAsString

	######################
	#  render_value      #
	#  __render_value__  #
	######################
	
	def __render_value__
	  
    return __value__.to_s
    
  end
  
  alias_method  :render_value, :__render_value__

end
