# -*- encoding : utf-8 -*-

module ::Perspective::View::ObjectInstance

  include ::Perspective::Bindings::Container::ObjectInstance

  include ::CascadingConfiguration::Setting
  include ::CascadingConfiguration::Array

  #####################
  #  «binding_order»  #
  #####################

  attr_array  :«binding_order» do

    #======================#
	  #  child_pre_set_hook  #
	  #======================#

	  def child_pre_set_hook( index, binding_name_or_instance, is_insert, parent_hash )
      
      child_instance = nil

      case binding_name_or_instance
        
        when ::Symbol, ::String
          
          case instance = configuration_instance
            when ::Perspective::View::ObjectInstance
              child_instance = instance.«binding»( binding_name_or_instance )
            else
              child_instance = binding_name_or_instance
          end

        when ::Perspective::Bindings::BindingBase::ClassBinding,
             ::Perspective::Bindings::BindingBase::InstanceBinding

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
  
	############################
  #  «render_binding_order»  #
  ############################
  
	def «render_binding_order»
		
    ensure_required_bindings_present! unless view_rendering_empty

		child_nodes = [ ]
		
		«binding_order».each do |this_binding|
	    child_nodes.push( result_node ) if result_node = this_binding.«render_value»
		end
		    
    return child_nodes
    
	end

  ################################
  #  required_bindings_present?  #
  ################################

  def required_bindings_present?
    
    render_value_valid = true
    
    «bindings».each do |this_name, this_binding|
      break unless render_value_valid = this_binding.required_bindings_present?
    end
    
    return render_value_valid
    
  end

  #######################################
  #  ensure_required_bindings_present!  #
  #######################################
  
  def ensure_required_bindings_present!
    
    «bindings».each { |this_name, this_binding| this_binding.ensure_required_bindings_present! }
    
    return self
    
  end
  
end
