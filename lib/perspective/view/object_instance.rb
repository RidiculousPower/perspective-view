
module ::Perspective::View::ObjectInstance

  include ::Perspective::Bindings::Container::ObjectInstance
  include ::Perspective::View::ObjectAndInstanceBinding

  include ::CascadingConfiguration::Setting
  include ::CascadingConfiguration::Array

  #######################
  #  __binding_order__  #
  #######################

  attr_array  :__binding_order__ do

    #======================#
	  #  child_pre_set_hook  #
	  #======================#

	  def child_pre_set_hook( index, binding_name_or_instance, is_insert, parent_hash )
      
      child_instance = nil

      case binding_name_or_instance
        
        when ::Symbol, ::String

          child_instance = configuration_instance.__binding__( binding_name_or_instance )

        when ::Perspective::Bindings::BindingBase::ClassBinding,
             ::Perspective::Bindings::BindingBase::InstanceBinding

          child_instance = configuration_instance.__binding__( binding_name_or_instance.__name__ )
          
      end
      
      return child_instance
      
	  end
	  
  end
  
  ###################
  #  binding_order  #
  ###################

  alias_method :binding_order, :__binding_order__
  
  #######################################
  #  binding_order_declared_empty?      #
  #  __binding_order_declared_empty__=  #
  #######################################
  
  attr_configuration  :binding_order_declared_empty? => :__binding_order_declared_empty__=

	##############################
  #  __render_binding_order__  #
  ##############################
  
	def __render_binding_order__
		
		__render_value_valid__?( true, @__view_rendering_empty__ )

		child_nodes = [ ]
		
		__binding_order__.each do |this_binding|
		  
		  if result_node = this_binding.__render_value__
		    child_nodes.push( result_node )
	    end
	    
		end
		
    @__view_rendering_empty__ = false
		    
    return child_nodes
    
	end

  #############################
  #  __render_value_valid__?  #
  #############################

  def __render_value_valid__?( ensure_valid = false, view_rendering_empty = @__view_rendering_empty__ )
    
    render_value_valid = true
    
    unless view_rendering_empty

      __bindings__.each do |this_binding_name, this_binding|
        render_value_valid = this_binding.__render_value_valid__?( ensure_valid, view_rendering_empty )
        break unless render_value_valid
      end

	  end
    
    return render_value_valid
    
  end

end
