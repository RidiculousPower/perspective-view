# -*- encoding : utf-8 -*-

module ::Perspective::View::ObjectAndInstanceBindingInstance

  include ::CascadingConfiguration::Array

  #####################
  #  «binding_order»  #
  #####################

  attr_instance_array  :«binding_order» do

    #================#
	  #  pre_set_hook  #
	  #================#

	  def pre_set_hook( index, binding_name_or_instance, is_insert, length )

      return case binding_name_or_instance
        when ::Symbol, ::String
          configuration_instance.«binding»( binding_name_or_instance )
        when ::Perspective::Bindings::ClassBinding
          configuration_instance.«binding»( binding_name_or_instance.«name» )
        when ::Perspective::Bindings::InstanceBinding
          binding_name_or_instance
     end

    end

    #======================#
	  #  child_pre_set_hook  #
	  #======================#

	  def child_pre_set_hook( index, binding_name_or_instance, is_insert, parent_array )

      return case binding_name_or_instance
        when ::Symbol, ::String
          configuration_instance.«binding»( binding_name_or_instance )
        when ::Perspective::Bindings::Binding
          configuration_instance.«binding»( binding_name_or_instance.«name» )
      end

	  end

  end

  ###################
  #  binding_order  #
  ###################

  self::Controller.alias_instance_method :binding_order, :«binding_order»
  
end
