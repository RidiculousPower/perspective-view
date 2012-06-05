
module ::Magnets::Abstract::View::Bindings::ClassBinding

  include ::Magnets::Bindings::ClassBinding::Configuration
  include ::Magnets::Abstract::View::Configuration
  
  #####################
  #  view_class       #
  #  view_class=      #
  #  __view_class__   #
  #  __view_class__=  #
  #####################
  
  alias_method :__view_class__, :__container_class__
  alias_method :__view_class__=, :__container_class__=

  alias_method :view_class, :__view_class__
  alias_method :view_class=, :__view_class__=
  
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
