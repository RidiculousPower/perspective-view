# -*- encoding : utf-8 -*-

module ::Perspective::BindingTypes::ViewBindings::InstanceBinding

  include ::Perspective::View::ObjectAndBindingInstance
  include ::Perspective::View::ObjectAndInstanceBindingInstance
    
  ############
  #  «view»  #
  ############

  alias_method :«view», :«container»

  #############
  #  «view»=  #
  #############

  alias_method :«view»=, :«container»=

  ###########
  #  view   #
  ###########

  alias_method :view, :«view»

  ###########
  #  view=  #
  ###########

  alias_method :view=, :«view»=

  ####################
	#  «render_value»  #
	####################
  
	def «render_value»( current_value = «value» )
	  
	  return current_value.to_s
	  
  end

  ################################
  #  required_bindings_present?  #
  ################################

  def required_bindings_present?
    
    render_value_valid = true
    
    if required? and «value».nil?
      render_value_valid = false
    elsif view = «view»
      render_value_valid = view.required_bindings_present?
    end

    return render_value_valid
    
  end
  
  #######################################
  #  ensure_required_bindings_present!  #
  #######################################
  
  def ensure_required_bindings_present!
    
    bindings_present = false

    if view = «view»
      view.ensure_required_bindings_present!
    end
    
    if required? and «value».nil?
      raise ::Perspective::Bindings::Exception::BindingRequired.new( self )
    end
    
    return self
    
  end
  
  ##################
  #  «view_count»  #
  ##################
  
  alias_method :«view_count», :«container_count»

  ######################
  #  rendering_empty!  #
  ######################
  
  def rendering_empty!
    
    @«view_rendering_empty» = true
    
  end
  
  ######################
  #  rendering_empty?  #
  ######################
  
  def rendering_empty?
    
    return @«view_rendering_empty» ||= false
    
  end
	
end
