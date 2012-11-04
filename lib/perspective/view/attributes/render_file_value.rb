
module ::Perspective::View::Attributes::RenderFileValue

	########################
	#  render_value        #
	#  autobind_value      #
	#  __render_value__    #
	#  __autobind_value__  #
	########################
	
	def __autobind_value__
	  
	  rendered_binding_value = nil
	  
    if ::Perspective::Configuration.files.by_path?          
      rendered_binding_value = ::File.path
    else
      rendered_binding_value = ::File.readlines.join
    end
    
    return rendered_binding_value
    
  end
  
  alias_method  :__render_value__, :__autobind_value__

end
