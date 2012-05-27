
module ::Magnets::Abstract::View::Attributes::RenderFileValue

	######################
	#  render_value      #
	#  __render_value__  #
	######################
	
	def __render_value__
	  
	  rendered_binding_value = nil
	  
    if ::Magnets::Configuration.files.by_path?          
      rendered_binding_value = ::File.path
    else
      rendered_binding_value = ::File.readlines.join
    end
    
    return rendered_binding_value
    
  end
  
  alias_method  :render_value, :__render_value__

end
