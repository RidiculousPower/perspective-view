
module ::Magnets::Abstract::View::Bindings::ClassBinding

  ccm = ::CascadingConfiguration::Methods
  
  ####################
  #  view_class      #
  #  __view_class__  #
  ####################
  
  class_binding = ::Magnets::Bindings::ClassBinding::Configuration
  
  ccm.alias_instance_method( class_binding, :__view_class__, :__container_class__ )

  ccm.alias_instance_method( class_binding, :view_class, :__view_class__ )

  ##################################
  #  __validate_container_class__  #
  ##################################

  def __validate_container_class__( container_class )
  
    super
  
    __validate_view_class__( container_class )
    
  end

  #############################
  #  __validate_view_class__  #
  #############################

  def __validate_view_class__( view_class )
    
    # implementation provided by including class/subclass or later included modules
    
  end
  
end
