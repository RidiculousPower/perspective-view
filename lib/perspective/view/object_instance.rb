
module ::Perspective::View::ObjectInstance

  include ::Perspective::Bindings::Container::ObjectInstance
  include ::Perspective::View::Configuration
  include ::Perspective::View::ObjectAndBindingInstance

	##############################
  #  __render_binding_order__  #
  ##############################
  
	def __render_binding_order__
		
		__render_value_valid__?( true, @__view_rendering_empty__ )

		child_nodes = [ ]
		
		__binding_order__.each do |this_binding_instance|
		  
		  if result_node = this_binding_instance.__render_value__
		    child_nodes.push( result_node )
	    end
	    
		end
		
    @__view_rendering_empty__ = false
		    
    return child_nodes
    
	end

  #########################
  #  __render_value_valid__?  #
  #########################

  def __render_value_valid__?( ensure_valid = false, view_rendering_empty = @__view_rendering_empty__ )
    
    render_value_valid = true
    
    unless view_rendering_empty

      __bindings__.each do |this_binding_name, this_binding_instance|
        
        render_value_valid = this_binding_instance.__render_value_valid__?( ensure_valid, 
                                                                        view_rendering_empty )

        break unless render_value_valid
      
      end

	  end
    
    return render_value_valid
    
  end

end
