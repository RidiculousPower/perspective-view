
module ::Perspective::View::Configuration

  include ::CascadingConfiguration::Setting
  include ::CascadingConfiguration::Array

  #######################
  #  binding_order      #
  #  __binding_order__  #
  #######################

  attr_array  :__binding_order__ do

    #======================#
	  #  child_pre_set_hook  #
	  #======================#

	  def child_pre_set_hook( index, binding_name, is_insert, parent_instance )
      
      child_instance = nil

      case instance = configuration_instance
        
        when ::Perspective::View::ObjectInstance
          
          case binding_name
            
            when ::Symbol, ::String

              child_instance = instance.__binding__( binding_name )

            when ::Perspective::Bindings::InstanceBinding

              child_instance = binding_name
            
          end

        else

          child_instance = binding_name
          
      end

      return child_instance
      
	  end
	  
  end
  
  Controller.alias_module_and_instance_methods( :binding_order, :__binding_order__ )
  
  #######################################
  #  binding_order_declared_empty?      #
  #  __binding_order_declared_empty__=  #
  #######################################
  
  attr_configuration  :binding_order_declared_empty? => :__binding_order_declared_empty__=

end
