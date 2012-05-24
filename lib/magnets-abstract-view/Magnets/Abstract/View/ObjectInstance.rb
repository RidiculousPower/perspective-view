
module ::Magnets::Abstract::View::ObjectInstance

  include ::CascadingConfiguration::Setting
  include ::CascadingConfiguration::Array

  ccm = ::CascadingConfiguration::Methods

  #######################
  #  binding_order      #
  #  __binding_order__  #
  #######################

  attr_configuration_array  :__binding_order__ do
    
    #======================#
	  #  child_pre_set_hook  #
	  #======================#

	  def child_pre_set_hook( index, binding_name, is_insert )
      
      child_instance = nil
      
      case configuration_instance
        
        when ::Magnets::Abstract::View::ObjectInstance

          child_instance = configuration_instance.__binding__( binding_name )
        
        else

          child_instance = binding_name
          
      end
      
      return child_instance
      
	  end
	  
  end
  
  ccm.alias_module_and_instance_methods( self, :binding_order, :__binding_order__ )
  
  #######################################
  #  binding_order_declared_empty?      #
  #  __binding_order_declared_empty__=  #
  #######################################
  
  attr_configuration  :binding_order_declared_empty? => :__binding_order_declared_empty__=
  
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
