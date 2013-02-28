
module ::Perspective::View::BindingDefinitions::RenderFileValue

	######################
	#  __render_value__  #
	######################
	
	def __render_value__( current_value = __value__ )
	  
	  rendered_binding_value = nil
	  
	  case current_value
  	  when ::File
        if ::Perspective::Configuration.files.by_path?          
          rendered_binding_value = current_value.to_path
        else
          rendered_binding_value = current_value.readlines.join
        end
      else
        rendered_binding_value = super( current_value )
	  end
    
    return rendered_binding_value
    
  end

end
