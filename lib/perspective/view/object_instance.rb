
module ::Perspective::View::ObjectInstance

  include ::Perspective::Bindings::Container::ObjectInstance

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
          
          case instance = configuration_instance
            when ::Perspective::View::ObjectInstance
              child_instance = instance.__binding__( binding_name_or_instance )
            else
              child_instance = binding_name_or_instance
          end

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

  Controller.alias_module_and_instance_methods :binding_order, :__binding_order__
  
  ###################################
  #  binding_order_declared_empty?  #
  ###################################
  
  ###
  #
  #
  attr_configuration  :binding_order_declared_empty? => :__binding_order_declared_empty__=
  
  ####################################################
  #  binding_order_declared_empty?  Default Setting  #
  ####################################################
  
  self.__binding_order_declared_empty__ = false
  
  #######################################
  #  __binding_order_declared_empty__=  #
  #######################################

  ###
  #
  #
  
  ######################
  #  rendering_empty!  #
  ######################
  
  def rendering_empty!
    
    self.__binding_order_declared_empty__ = true
    
    return self
    
  end
  
  ##########################
  #  rendering_empty?  #
  ##########################
  
  def rendering_empty?
    
    return binding_order_declared_empty?
    
  end
  
	##############################
  #  __render_binding_order__  #
  ##############################
  
	def __render_binding_order__
		
		ensure_required_bindings_present!

		child_nodes = [ ]
		
		__binding_order__.each do |this_binding|
		  if result_node = this_binding.__render_value__
		    child_nodes.push( result_node )
	    end
		end
		
    self.__binding_order_declared_empty__ = false
		    
    return child_nodes
    
	end

  ################################
  #  required_bindings_present?  #
  ################################

  def required_bindings_present?
    
    render_value_valid = true
    
    __bindings__.each do |this_binding_name, this_binding|
      render_value_valid = this_binding.required_bindings_present?
      break unless render_value_valid
    end
    
    return render_value_valid
    
  end

  #######################################
  #  ensure_required_bindings_present!  #
  #######################################
  
  def ensure_required_bindings_present!
    
    __bindings__.each do |this_binding_name, this_binding|
      this_binding.ensure_required_bindings_present!
    end
    
    return self
    
  end
  
end
