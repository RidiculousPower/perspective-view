
module ::Magnets::View::ObjectInstance

  include ::Magnets::Bindings::Container::ObjectInstance
  include ::Magnets::View::Configuration
  
  ######################
  #  rendering_empty!  #
  ######################
  
  def rendering_empty!
    
    @__view_rendering_empty__ = true
    
  end
  
  ######################
  #  rendering_empty?  #
  ######################
  
  def rendering_empty?
    
    return @__view_rendering_empty__ ||= false
    
  end

	##############################
  #  __render_binding_order__  #
  ##############################
  
	def __render_binding_order__
		
		render_value_valid?( true, @__view_rendering_empty__ )

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
  #  render_value_valid?  #
  #########################

  def render_value_valid?( ensure_valid = false, view_rendering_empty = @__view_rendering_empty__ )
    
    render_value_valid = true
    
    unless view_rendering_empty

      __bindings__.each do |this_binding_name, this_binding_instance|
        
        render_value_valid = this_binding_instance.render_value_valid?( ensure_valid, 
                                                                        view_rendering_empty )

        break unless render_value_valid
      
      end

	  end
    
    return render_value_valid
    
  end

end
