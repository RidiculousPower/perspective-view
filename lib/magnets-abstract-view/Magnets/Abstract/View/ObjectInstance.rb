
module ::Magnets::Abstract::View::ObjectInstance

  include ::Magnets::Bindings::Container::ObjectInstance
  include ::Magnets::Abstract::View::Configuration
  
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
		
		child_nodes = [ ]
		
		__binding_order__.each do |this_binding_instance|
			
		  if result_node = this_binding_instance.__render_value__
		    child_nodes.push( result_node )
	    end
	    
		end
		    
    return child_nodes
    
	end

  ############################################
  #  ensure_binding_render_values_valid      #
  #  __ensure_binding_render_values_valid__  #
  ############################################
  
  def __ensure_binding_render_values_valid__
  
    # if we are rendering an empty container we don't want to raise an error for empty required values
    unless @__view_rendering_empty__
      
      __bindings__.each do |this_binding_name, this_binding_instance|
        
        unless this_binding_instance.render_value_valid?
          raise ::Magnets::Bindings::Exception::BindingRequired,
                'Binding value required for :' + this_binding_name.to_s + ', but received nil.'
        end
        
      end

    else

      @__view_rendering_empty__ = false

	  end
    
  end
  
  alias_method  :ensure_binding_render_values_valid, :__ensure_binding_render_values_valid__
  
end
