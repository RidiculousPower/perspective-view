
module ::Magnets::Abstract::View::Configuration

  ccm = ::CascadingConfiguration::Methods

  include ::CascadingConfiguration::Setting
  include ::CascadingConfiguration::Array

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
      
      case instance = configuration_instance
        
        when ::Magnets::Abstract::View::ObjectInstance
          
          case binding_name
            
            when ::Symbol, ::String

              child_instance = instance.__binding__( binding_name )

            when ::Magnets::Bindings::InstanceBinding

              child_instance = binding_name
            
          end

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

end
