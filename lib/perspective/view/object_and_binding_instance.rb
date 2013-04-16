# -*- encoding : utf-8 -*-

module ::Perspective::View::ObjectAndBindingInstance
  
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
      
      return case instance = configuration_instance
       when ::Perspective::View::ObjectInstance, ::Perspective::Bindings::InstanceBinding
          case binding_name_or_instance
            when ::Symbol, ::String
              instance.«binding»( binding_name_or_instance )
            when ::Perspective::Bindings::ClassBinding
              instance.«binding»( binding_name_or_instance.«name» )
            when ::Perspective::Bindings::InstanceBinding
              binding_name_or_instance
          end
        else
          binding_name_or_instance
      end

    end
    
    #======================#
	  #  child_pre_set_hook  #
	  #======================#

	  def child_pre_set_hook( index, binding_name_or_instance, is_insert, parent_array )
      
      instance = configuration_instance
      
      return case binding_name_or_instance
        when ::Symbol, ::String
         case instance
            when ::Perspective::View::ObjectInstance
              instance.«binding»( binding_name_or_instance )
            else
              binding_name_or_instance
          end
        when ::Perspective::Bindings::Binding
          instance.«binding»( binding_name_or_instance.«name» )
      end
      
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
  
  ###########################################
  #  binding_order_declared_empty? Default  #
  ###########################################
  
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
