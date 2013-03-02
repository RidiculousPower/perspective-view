# -*- encoding : utf-8 -*-

module ::Perspective::View::ObjectInstanceAndBindingInstance
  
  include ::Perspective::View::Configuration
  
  include ::CascadingConfiguration::Array
  include ::CascadingConfiguration::Setting
  
  #####################
  #  «binding_order»  #
  #####################

  attr_array  :«binding_order» do

    #================#
	  #  pre_set_hook  #
	  #================#

	  def pre_set_hook( index, binding_name_or_instance, is_insert, length )
      
      set_value = nil
      
      case instance = configuration_instance
        
        when ::Perspective::View::ObjectInstance,
             ::Perspective::Bindings::InstanceBinding
        
          case binding_name_or_instance
            when ::Symbol, ::String
              set_value = instance.«binding»( binding_name_or_instance )
            when ::Perspective::Bindings::ClassBinding
              set_value = instance.«binding»( binding_name_or_instance.«name» )
            when ::Perspective::Bindings::InstanceBinding
              set_value = binding_name_or_instance
          end
        
        else
          
          set_value = binding_name_or_instance
          
      end

      return set_value
      
    end
    
    #======================#
	  #  child_pre_set_hook  #
	  #======================#

	  def child_pre_set_hook( index, binding_name_or_instance, is_insert, length )
      
      child_instance = nil

      case binding_name_or_instance
        
        when ::Symbol, ::String
          
          case instance = configuration_instance
            when ::Perspective::View::ObjectInstance
              child_instance = instance.«binding»( binding_name_or_instance )
            else
              child_instance = binding_name_or_instance
          end

        when ::Perspective::Bindings::ClassBinding,
             ::Perspective::Bindings::InstanceBinding

          child_instance = configuration_instance.«binding»( binding_name_or_instance.«name» )
          
      end
      
      return child_instance
      
	  end
	  
  end
  
  ###################
  #  binding_order  #
  ###################

  Controller.alias_module_and_instance_methods :binding_order, :«binding_order»
  
  ###################################
  #  binding_order_declared_empty?  #
  ###################################
  
  ###
  #
  #
  attr_configuration  :binding_order_declared_empty? => :«binding_order_declared_empty»=
  
  ####################################################
  #  binding_order_declared_empty?  Default Setting  #
  ####################################################
  
  self.«binding_order_declared_empty» = false
  
  #####################################
  #  «binding_order_declared_empty»=  #
  #####################################

  ###
  #
  #
  
  ######################
  #  rendering_empty!  #
  ######################
  
  def rendering_empty!
    
    self.«binding_order_declared_empty» = true
    
    return self
    
  end
  
  ######################
  #  rendering_empty?  #
  ######################
  
  def rendering_empty?
    
    return binding_order_declared_empty?
    
  end
  

end
