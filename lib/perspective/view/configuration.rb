
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

	  def child_pre_set_hook( index, binding_name_or_instance, is_insert, parent_hash )
      
      child_instance = nil

      case binding_name_or_instance
        
        when ::Symbol, ::String

          child_instance = configuration_instance.__binding__( binding_name_or_instance )

        when ::Perspective::Bindings::ClassBinding,
             ::Perspective::Bindings::InstanceBinding

          child_instance = configuration_instance.__binding__( binding_name_or_instance.__name__ )
          
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
