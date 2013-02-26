
module ::Perspective::BindingTypes::ViewBindings::ClassBinding
  
  ####################
  #  __view_class__  #
  ####################

  alias_method :__view_class__, :__container_class__

  #####################
  #  __view_class__=  #
  #####################
  
  alias_method :__view_class__=, :__container_class__=

  ################
  #  view_class  #
  ################

  alias_method :view_class, :__view_class__

  #################
  #  view_class=  #
  #################

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

  ################
  #  __render__  #
  ################

  alias_method :__render__, :__configure__

  ############
  #  render  #
  ############

  alias_method :render, :__render__

end
