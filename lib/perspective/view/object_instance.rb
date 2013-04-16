# -*- encoding : utf-8 -*-

module ::Perspective::View::ObjectInstance

  include ::Perspective::Bindings::Container::ObjectInstance
  include ::Perspective::View::ObjectAndBindingInstance
  
  include ::CascadingConfiguration::Setting
  include ::CascadingConfiguration::Array

	############################
  #  «render_binding_order»  #
  ############################
  
	def «render_binding_order»
		
    ensure_required_bindings_present! unless binding_order_declared_empty?

		child_nodes = [ ]
		
		«binding_order».each do |this_binding|
		  if result_node = this_binding.«render_value»
	      child_nodes.push( result_node )
      end
		end
		    
    return child_nodes
    
	end

  ################################
  #  required_bindings_present?  #
  ################################

  def required_bindings_present?
    
    render_value_valid = true
    
    «bindings».each do |this_name, this_binding|
      if this_binding.respond_to?( :required_bindings_present? )
        break unless render_value_valid = this_binding.required_bindings_present?
      end
    end
    
    return render_value_valid
    
  end

  #######################################
  #  ensure_required_bindings_present!  #
  #######################################
  
  def ensure_required_bindings_present!
    
    «bindings».each do |this_name, this_binding| 
      if this_binding.respond_to?( :ensure_required_bindings_present! )
        this_binding.ensure_required_bindings_present!
      end
    end
    
    return self
    
  end
  
end
